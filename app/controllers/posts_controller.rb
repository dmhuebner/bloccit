class PostsController < ApplicationController
	before_action :require_sign_in, except: :show
	before_action :authorize_user, except: [:show, :new, :create, :edit, :update]
	# before_action :authorize_moderator, except: [:show, :new, :create, :edit, :update]

	def show
		@post = Post.find(params[:id])
	end

	def new
		@topic = Topic.find(params[:topic_id])
		@post = Post.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.build(post_params)
		@post.user = current_user

		if @post.save
			flash[:notice] = "Post was saved."
			redirect_to [@topic, @post]
		else
			flash.now[:alert] = "There was an error saving the post. Please try again."
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
		@topic = Topic.find(params[:topic_id])
		@post.topic = @topic
		unless current_user.id == @post.user_id || current_user.moderator? || current_user.admin?
			flash[:alert] = "You must be an admin to do that."
			redirect_to [@topic, @post]
		end
	end

	def update
		@topic = Topic.find(params[:topic_id])
		@post = Post.find(params[:id])
		@post.topic = @topic
		@post.assign_attributes(post_params)
		unless current_user.id == @post.user_id || current_user.moderator? || current_user.admin?
			flash[:alert] = "You must be an admin to do that."
			redirect_to [@topic, @post]
		else
			if @post.save
				flash[:notice] = "Post was updated successfully."
				redirect_to [@post.topic, @post]
			else
				flash[:alert] = "There was an error saving the post. Please try again."
				render :edit
			end
		end
	end

	def destroy
		@post = Post.find(params[:id])
		unless current_user.id = @post.user_id || current_user.admin?
			flash[:alert] = "You must be an admin to do that."
			redirect_to [post.topic, post]
		else
			if @post.destroy
				flash[:notice] = "\"#{@post.title}\" was deleted successfully."
				redirect_to @post.topic
			else
				flash.now[:alert] = "There was an error deleting the post."
				render :show
			end
		end
	end

	private
	def post_params
		params.require(:post).permit(:title, :body, :user_id)
	end

	def authorize_user
		post = Post.find(params[:id])
		unless current_user == post.user || current_user.admin?
			flash[:alert] = "You must be an admin to do that."
			redirect_to [post.topic, post]
		end
	end

	# def authorize_moderator
	# 	post = Post.find(params[:id])
	# 	unless current_user == post.user || current_user.moderator?
	# 		flash[:alert] = "You must be an admin to do that."
	# 		redirect_to [post.topic, post]
	# 	end
	# end
end
