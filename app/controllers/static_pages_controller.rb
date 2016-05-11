class StaticPagesController < ApplicationController
  def friend
  	@users = User.all
  end



end
