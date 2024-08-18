module Admin
  class PostsController < ApplicationController
    before_action :authenticate_user!
    skip_before_action :authenticate_user!, only: [:test123]
    def index
      @posts = Post.includes(:user).all
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)
      respond_to do |format|
        if @post.save
          format.html { redirect_to post_params, notice: 'Post was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def test123
      redirect_to admin_users_path
    end

    private
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end

  end
end
