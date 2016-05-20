class CategoriesController < ApplicationController

	def index
		@category = Category.where(:slug=> params[:category]).take
		@products = @category.products.paginate(:page=>params[:page],:per_page => 30)
	end 

end
