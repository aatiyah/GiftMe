class ApplicationController < ActionController::Base
	include PublicActivity::StoreController

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :authenticate_user!, :except => [:welcome]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, 
    :password_confirmation, :name, :username, :birthday, :avatar_img, :first_name, :last_name) }

   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit({ roles: [] }, :email, :password, 
   :password_confirmation, :current_password, :name, :username, :birthday, :avatar_img, :first_name, :last_name) }
  end
end
