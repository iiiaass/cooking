class Public::RelationshipsController < ApplicationController
  before_action :authenticate_customer!
  def create
    #@customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end

  def followings
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings.only_active
    @customers_count=@customers.count

  end

  def followers
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers.only_active
    @customers_count=@customers.count
  end

end
