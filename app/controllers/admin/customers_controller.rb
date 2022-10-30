class Admin::CustomersController < ApplicationController
  def index
    @customers=Customer.all
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer=Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def show
    @customer=Customer.find(params[:id])
    @posts=@customer.posts
    if @customer.is_deleted==true
      @status="退会"
    else
      @status="有効"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:introduction,:profile_image,:is_deleted,:email)
  end
end
