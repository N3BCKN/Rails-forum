module PostsHelper
	def user_avatar(user)
		if user.avatar.attached?
			image_tag user.avatar, class: "img-fluid rounded-circle mt-3 ml-2"
		else
			image_tag 'default_avatar.png', class: "img-fluid rounded-circle mt-3 ml-2"
		end
	end
end
