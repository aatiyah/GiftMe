# http://railsguides.net/how-to-generate-rake-task/
# http://www.nokogiri.org/
# Full Text Search: http://www.postgresql.org/docs/8.3/static/textsearch.html
require 'rubygems'
require 'nokogiri'
require 'open-uri'
#namespace :scraper_test do
 # desc "TODO"
#  task scrape: :environment do
url = ["http://www.bestbuy.com/site/searchpage.jsp?cp=2&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases","http://www.bestbuy.com/site/searchpage.jsp?cp=3&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases","http://www.bestbuy.com/site/searchpage.jsp?cp=4&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases","http://www.bestbuy.com/site/laptop-computers/all-laptops/pcmcat138500050001.c?id=pcmcat138500050001","http://www.bestbuy.com/site/searchpage.jsp?cp=2&searchType=search&_dyncharset=UTF-8&ks=960&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&seeAll=&browsedCategory=pcmcat138500050001&st=pcmcat138500050001_categoryid%24abcat0502000&qp=null"]
result = []
url.each do |u|
  # loop through url array
  doc = Nokogiri::HTML(open(u))
  doc.css(".list-item").each do |product|
      # textWrapper class will contain title and price info of product
      title = product.css(".sku-title a").text#.delete("\n").gsub("NEW!\u00A0","").gsub(", Only at Macy's","")
      # delete unnecessary /n and use gsub to remove particular string in the name of product
      # gsub respect the pattern string, which is different than delete method
      price = product.css(".medium-item-price").text.scan(/\$(\d+\.\d\d)/).join.to_f
      # use Regex to get only numbers out
      # scan method returns an array of matching string
      #result.push({title: title, price: price, category_id: 1})
      # create an array of results to poulate the database later
  
 img_url = product.css(".list-item-thumbnail-column img").map{ |i| i['data-src'] }.join
      # ref:http://stackoverflow.com/questions/5813446/extract-img-tags-in-ruby
      # tried using .attr method, but will return description results
      result.push({title: title, price: price, category_id: 1,img_url: img_url})
      # create an array of results to poulate the database later
   end
end

#puts result
 

 f = File.new("result.rb", "w")
 # create a new write-only file
 f.puts("Product.create!([", result, "])")
 # puts info in as the same format as that of seeds.rb

=begin
require 'rubygems'
require 'nokogiri'
require 'open-uri'

#namespace :scraper_test do
 # desc "TODO"
#  task scrape: :environment do
​url = ["http://www.bestbuy.com/site/searchpage.jsp?cp=2&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases", "http://www.bestbuy.com/site/searchpage.jsp?cp=3&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases","http://www.bestbuy.com/site/searchpage.jsp?cp=4&searchType=search&nrp=15&seeAll=&browsedCategory=abcat0700000&qp=newreleases_facet%3DReleases~New%20Releases%5Ecategory_facet%3DPre-Owned%20Games~pcmcat232900050017&ks=960&sp=-bestsellingsort%20skuidsaas&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&st=categoryid%24abcat0700000&lid=Products%3A%20All%20New%20Releases","http://www.bestbuy.com/site/laptop-computers/all-laptops/pcmcat138500050001.c?id=pcmcat138500050001","http://www.bestbuy.com/site/searchpage.jsp?cp=2&searchType=search&_dyncharset=UTF-8&ks=960&sc=Global&list=y&usc=All%20Categories&type=page&id=pcat17071&iht=n&seeAll=&browsedCategory=pcmcat138500050001&st=pcmcat138500050001_categoryid%24abcat0502000&qp=null"]
result = []
url.each do |u|
  # loop through url array
  doc = Nokogiri::HTML(open(u))
​
  doc.css(".list-item").each do |product|
      # textWrapper class will contain title and price info of product
      title = product.css(".sku-title a").text#.delete("\n").gsub("NEW!\u00A0","").gsub(", Only at Macy's","")
      # delete unnecessary /n and use gsub to remove particular string in the name of product
      # gsub respect the pattern string, which is different than delete method
      price = product.css(".medium-item-price").text.scan(/\$(\d+\.\d\d)/).join.to_f
      # use Regex to get only numbers out
      # scan method returns an array of matching string
      result.push({title: title, price: price, category_id: 1})
      # create an array of results to poulate the database later
   end
end
​
​
​
​
 f = File.new("result.rb", "w")
 # create a new write-only file
 f.puts("Product.create!([", result, "])")
 # puts info in as the same format as that of seeds.rb 
#  end 
#end
=end