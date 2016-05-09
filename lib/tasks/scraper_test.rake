# http://railsguides.net/how-to-generate-rake-task/
# http://www.nokogiri.org/
# Full Text Search: http://www.postgresql.org/docs/8.3/static/textsearch.html
namespace :scraper_test do
  desc "TODO"
  task scrape: :environment do
  	# the url we want to scrape
      url = "http://www1.macys.com/shop/womens-clothing/womens-tops?id=255&edge=hybrid"
      # Macy's Dress "http://www1.macys.com/shop/womens-clothing/dresses?id=5449&edge=hybrid"
      # get the raw HTML content
      response = HTTParty.get url
      html = response.body

      # get the root document so we can parse it using CSS selectors
      doc = Nokogiri::HTML(html)
      # Get each product on the page (#atfResults ul li)
      n = 0
      doc.css(".textWrapper").each do |product|
        # get the text content of the h2 element for each li item
        title = product.css(".productThumbnailLink").text.delete "\n"
        price = product.css(".priceSale").text.scan(/\$(\d+\.\d\d)/).join.to_f
        product = Product.new
        product.title = title
        product.price = price
        product.category_id = 3
        product.save
      end
  end
end
