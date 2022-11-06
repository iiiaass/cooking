class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @genres = Genre.all
    @customer = Customer.find(params[:id])
    @nice =params[:nice]
    if @nice.present?
      @posts = @customer.niced_posts.order(created_at: :desc)
    else
      @posts = @customer.posts.order(created_at: :desc)
    end
  end

  def edit
    @genres = Genre.all
    @customer = Customer.find(params[:id])
  end

  def update
    @genres = Genre.all
    @customer = current_customer
   if @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
   else
    render:edit
   end
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end


  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:introduction,:profile_image,:is_deleted,:email)
  end

end
