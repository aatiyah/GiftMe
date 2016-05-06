# http://railsguides.net/how-to-generate-rake-task/
# http://www.nokogiri.org/
# Full Text Search: http://www.postgresql.org/docs/8.3/static/textsearch.html
namespace :scraper_test do
  desc "TODO"
  task scrap: :environment do
  	# the url we want to scrape
      url = "http://www.amazon.com/s/ref=lp_2619525011_nr_n_5?fst=as%3Aoff&rh=n%3A2619525011%2Cn%3A%212619526011%2Cn%3A2686328011&bbn=2619526011&ie=UTF8&qid=1462292509&rnid=2619526011"
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
