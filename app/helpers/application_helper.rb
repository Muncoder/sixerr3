module ApplicationHelper

	def avatar_url(user)
		gravatar = Digest::MD5.hexdigest(user.email).downcase
			"https://www.gravatar.com/avatar/#{gravatar}.jpg?s=30"
	end

end
