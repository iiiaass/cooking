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
  end

  def show
   @post=Post.find(params[:id])
   @customer=current_customer
  end

  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to show_path
  end

  private
  def post_params
    params.require(:post).permit(:title,:article,:image,:genre_id)
  end
end
