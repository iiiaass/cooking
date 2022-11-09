class Admin::RelationshipsController < ApplicationController
  def followings
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    if  params[:filter] == "only_active"
      @customers = @customer.followings.only_active
    else
      @customers = @customer.followings
    end
    @customers_count = @customers.count
  end

  def followers
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    if  params[:filter] == "only_active"
      @customers = @customer.followers.only_active
    else
      @customers = @customer.followers
    end
    @customers_count=@customers.count
  end
end
