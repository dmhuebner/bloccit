module UsersHelper
	def has_posts?
		current_user.posts.count > 0
	end

	def has_comments?
		current_user.comments.count > 0
	end

	def has_favorites?
		current_user.favorites.count > 0
	end
end
