module Admin
  class PostsController < ApplicationController
    before_action :authenticate_user!,:authorize_post, only: [:index,:new,:create,:show]
    after_action :verify_authorized
    def index
      @posts = Post.includes(:user).where(user_id: current_user.id)
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

    def show

    end

    private
      def post_params
        params.require(:post).permit(:title, :body, :user_id)
      end
      def authorize_post
        authorize Post
      end


  end
end
