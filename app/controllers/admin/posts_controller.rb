class Admin::PostsController < ApplicationController
  
  def index
    @posts=Post.all
    if params[:search]
    @posts = Post.search(params[:search])
    end
  end

  def show
   @post=Post.find(params[:id])
   @customer=@post.customer
  end
  
  def destroy
   @post=Post.find(params[:id])
   @customer=@post.customer
   @post.destroy
   redirect_to admin_customer_path(@customer.id)
  end
  
end
