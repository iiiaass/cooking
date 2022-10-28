class Public::CustomersController < ApplicationController
  def show
    @customer=current_customer
    @posts=@customer.posts
  end

  

  def edit
  end


end
