class CategoriesController < ApplicationController


	def index
		@category = Category.where :slug=> params[:category_name]	
	end 


	private
    	# Use callbacks to share common setup or constraints between actions.
	    def set_category
	      @product = category.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def category_params
	      params.require(:category).permit(:name, :slug)
	    end

end
