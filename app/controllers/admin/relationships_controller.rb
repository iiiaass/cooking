class Admin::RelationshipsController < ApplicationController
  def followings
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followings
    # @customers = @customers.joins(:customer).where(customer: {is_deleted: false})
    @customers_count = @customers.count
  end

  def followers
    @genres = Genre.all
    @customer = Customer.find(params[:customer_id])
    @customers = @customer.followers
    # @customers = @customers.joins(:customer).where(customer: {is_deleted: false})
    @customers_count=@customers.count
  end
end
