class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @posts = Post.all.order(created_at: :desc)
    if params[:search]
    @posts = Post.search(params[:search])
    elsif params[:genre_id]
     genre =Genre.find(params[:genre_id])
     @posts =genre.posts
    end
    @post_count=@posts.count
    @posts=@posts.page(params[:page]).order(created_at: :desc)
    # @post_count = 0
    # @posts. each do |post|
    #   unless post.customer.is_deleted
    #     @post_count += 1
    #   end
    # end
  end

  def show
   @genres = Genre.all
   @post = Post.find(params[:id])
   @customer = @post.customer
   active_customer_ids = Customer.only_active.ids
   @comments = @post.comments.where(customer_id: active_customer_ids)#モデル名.where(カラム名: 内容)
  end

  def destroy
   @post = Post.find(params[:id])
   @customer = @post.customer
   @post.destroy
   redirect_to admin_customer_path(@customer.id)
  end

end
