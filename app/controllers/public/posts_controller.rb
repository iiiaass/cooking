class Public::PostsController < ApplicationController
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
   @posts = Post.all.order(created_at: :desc)
   if params[:search]
    @posts = Post.search(params[:search])
   elsif params[:genre_id]
    genre = Genre.find(params[:genre_id])
    @posts = genre.posts
   end

   @post_count = 0
   @posts.each do |post|
    unless post.customer.is_deleted
     @post_count += 1
    end
   end

  end

  def show
   @post = Post.find(params[:id])
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
