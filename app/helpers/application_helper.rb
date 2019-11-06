module ApplicationHelper
	def user_avatar(user, size=10)
		if user.avatar.attached?
			user.avatar.variant(resize: "10x10")
		else
			gravatar_image_url(user.email, size: size)	
		end
	end
end
