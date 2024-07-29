class PostsController < ApplicationController
  before_action :authenticate_user!
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

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

end
