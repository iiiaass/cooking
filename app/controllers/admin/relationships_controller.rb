class Admin::RelationshipsController < ApplicationController
  def followings
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings
  end

  def followers
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers
  end
end
