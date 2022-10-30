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
   @posts= Post.all
   if params[:search]
    @posts = Post.search(params[:search])
   end
   # @post=Post.new
  end

  def show
   @post=Post.find(params[:id])
   @customer=@post.customer
   @comment =Comment.new

  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to customer_path(current_customer.id)
  end

  private
  def post_params
    params.require(:post).permit(:title,:article,:image [] ,:genre_id)
  end
end
