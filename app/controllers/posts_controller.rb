class PostsController < ApplicationController
	before_action :authenticate, only: [:admin, :new, :create, :edit, :update, :destroy]
	before_action :find_post, only: [:show, :edit, :update, :destroy]


	def index
		if params[:category].blank?
  			@posts = Post.all.order("created_at DESC")
		else
  			@category_id = Category.find_by(name: params[:category]).id
  			@posts = Post.where(category_id: @category_id).order("created_at DESC")
  		end
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, notice: "Post successfully created!"
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post successfully updeated!"
		else
			render "edit"
		end
	end


	def destroy
		@post.destroy
		redirect_to root_path, notice: "Post deleted!"
	end

	def admin
		redirect_to root_path if authenticate
	end


private

	def post_params
		params.require(:post).permit(:title, :content, :category_id, :image)
	end

	def find_post
		@post = Post.find(params[:id])
	end

	protected
	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			adm_username = Rails.application.credentials[:admin_username]
			adm_password = Rails.application.credentials[:admin_password]
			username == adm_username && password == adm_password
		end
	end



end
