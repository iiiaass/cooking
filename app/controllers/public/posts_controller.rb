class Public::PostsController < ApplicationController
  def new
   @post=Post.new
  end

  def create
   post=Post.new(post_params)
   post.customer_id=current_customer.id
   post.save!
   redirect_to posts_path
  end

  def index
   @posts=Post.all
  end

  def show
  end

  def search
    @posts = Post.search(params[:search])
  end

  private
  def post_params
    params.require(:post).permit(:title,:article,:image,:genre_id)
  end
end
