class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  def new
   @post = Post.new
   @genres = Genre.all
  end

  def create
   @genres = Genre.all
   post = Post.new(post_params)
   post.customer_id = current_customer.id
   if post.save
    redirect_to posts_path
   else
    @post = post
    render :new
   end
  end

  def index
   @genres = Genre.all
   @posts = Post.joins(:customer).where(customer: {is_deleted: false})
   if params[:search]
    @posts = Post.joins(:customer).where(customer: {is_deleted: false}).search(params[:search])
   elsif params[:genre_id]
    genre = Genre.find(params[:genre_id])
    @posts = genre.posts.joins(:customer).where(customer: {is_deleted: false})
   end
   @post_count=@posts.count
   @posts=@posts.page(params[:page]).order(created_at: :desc)

   # active_customer_ids = Customer.only_active.ids
   # @posts = Post.comments.where(customer_id: active_customer_ids)
  end

  def show
   @genres = Genre.all
   @post = Post.find(params[:id])
   active_customer_ids = Customer.only_active.ids
   @comments = @post.comments.where(customer_id: active_customer_ids)#モデル名.where(カラム名: 内容)
   @customer = @post.customer
   @comment = Comment.new

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to customer_path(current_customer.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :article, :genre_id, images: [])
  end
end
