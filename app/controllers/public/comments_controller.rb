class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!
  def create
    @genres = Genre.all
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.post_id = @post.id
    if @comment.save
     redirect_to post_path(@post.id)
    else
     @customer = @post.customer
     render:'public/posts/show'
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])
  end



  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
