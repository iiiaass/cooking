class Admin::CustomersController < ApplicationController
  def index
  end

  def edit
  end

  def show
    @customer=Customer.find(params[:id])
    @posts=@customer.posts
  end
end
