module CommentsHelper
	def user_is_authorized_for_comment?(comment)
		current_user && (comment.user_id == current_user.id || current_user.admin?)
	end
end
