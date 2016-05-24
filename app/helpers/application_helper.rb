module ApplicationHelper
	def avatar_img(user)
		if user.avatar_img.present?
			user.avatar_img
		else
			#default_url="#{root_url}assets/avatar/detective.png"
			default_url='http://www.yuph.net/assets/user-default.jpg'
			gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
			"http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}&s=200"
		end
	end
	# railscast 244: http://railscasts.com/episodes/244-gravatar

end
