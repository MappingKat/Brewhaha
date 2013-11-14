class AdminController < ApplicationController
  # before_action :can_access

  def index
    authorized_admin?
    @orders = Order.all 
    @users = User.all
    @items = Item.all
    @order_items = OrderItem.all
  end

end
