class Public::NicesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    nice = current_customer.nices.new(post_id: post.id)
    nice.save
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:post_id])
    nice = current_customer.nices.find_by(post_id: post.id)
    nice.destroy
    redirect_to post_path(post.id)
  end
end
