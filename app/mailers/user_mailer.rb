class UserMailer < ApplicationMailer
default from:tstead33@gmail.com
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.list_to_friend.subject
  #
  def list_to_friend(user)
  	@user = user
    @greeting = "Hi"

    mail to: user.email, subject: "My Wishlist"
  end
end
