# http://railsguides.net/how-to-generate-rake-task/
# http://www.nokogiri.org/
# Full Text Search: http://www.postgresql.org/docs/8.3/static/textsearch.html
namespace :scraper_test do
  desc "TODO"
  task scrap: :environment do
  	# the url we want to scrape
      url = "http://www.bestbuy.com/site/searchpage.jsp?cp=1&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases"
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
