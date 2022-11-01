class Admin::PostsController < ApplicationController

  def index
    @genres = Genre.all
    @posts=Post.all.order(created_at: :desc)
    if params[:search]
    @posts = Post.search(params[:search])
    elsif params[:genre_id]
     genre =Genre.find(params[:genre_id])
     @posts =genre.postrs
    end

    @post_count = 0
    @posts. each do |post|
      unless post.customer.is_deleted
        @post_count += 1
      end
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
