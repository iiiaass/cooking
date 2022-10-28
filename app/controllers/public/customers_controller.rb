class Public::CustomersController < ApplicationController
  def show
    @customer=Customer.find(params[:id])
    @posts=@customer.posts
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=current_customer
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def withdraw
    @customer=current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:introduction,:profile_image,:is_deleted)
  end

end
