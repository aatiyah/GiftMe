# http://railsguides.net/how-to-generate-rake-task/
# http://www.nokogiri.org/
# Full Text Search: http://www.postgresql.org/docs/8.3/static/textsearch.html
namespace :scraper_test do
  desc "TODO"
  task scrap: :environment do
  	# the url we want to scrape
      url = "http://www1.macys.com/shop/womens-clothing/dresses?id=5449&edge=hybrid"
      # get the raw HTML content
      response = HTTParty.get url
      html = response.body

      # get the root document so we can parse it using CSS selectors
      doc = Nokogiri::HTML(html)
      # Get each product on the page (#atfResults ul li)
      doc.css("#atfResults ul li").each do |product|
        # get the text content of the h2 element for each li item
        title = product.css("h2").text
        product = Product.new
        product.title = title
        product.save
      end
  end
end
