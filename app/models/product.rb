class Product < ActiveRecord::Base
	belongs_to :category

	def self.search(search)
	  if search
	    where('title LIKE ?', "%#{search}%")
	    #where('title ILIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end
