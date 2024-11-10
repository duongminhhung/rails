module Admin
  class PostsController < ApplicationController
    before_action :authenticate_user!,:authorize_post, only: [:index,:new,:create,:show]
    after_action :verify_authorized
    def index
      # custome where exits
      # @posts = Post.where_assoc_exists(:user) do |user|
      #   user.where_assoc_exists(:user_permissions) do |user_permissions|
      #     user_permissions.where(permission_id: 1)
      #   end
      #     .or(
      #       user.where_assoc_exists(:group) do |group|
      #         group.where(name: 'Admin')
      #       end
      #     )
      # end.includes(:user)
      @posts = Post.where_assoc_exists(:user).includes(:user)
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
