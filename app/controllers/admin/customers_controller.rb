class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genres = Genre.all
    @customers = Customer.page(params[:page])
  end

  def edit
    @genres = Genre.all
    @customer = Customer.find(params[:id])
  end

  def update
    @genres = Genre.all
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
     redirect_to admin_customer_path(@customer.id)
    else
     render:edit
    end
  end

  def show
    @genres = Genre.all
    @customer = Customer.find(params[:id])
    if @customer.is_deleted == true
      @status = "退会"
    else
      @status = "有効"
    end
    @nice =params[:nice]
    if @nice.present?
      @posts = @customer.niced_posts.page(params[:page]).order(created_at: :desc)
    else
      @posts = @customer.posts.page(params[:page]).order(created_at: :desc)
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:introduction,:profile_image,:is_deleted,:email)
  end
end
