class Public::PostsController < ApplicationController
  def new
  end

  def index

  end

  def show
  end

  def search
    @posts = Post.search(params[:search])
  end
end
