class AdminOrdersController < ApplicationController
  
  def index
    @orders = Order.all
    @customers = Customer.all
    @items = Item.all
    @order_items = OrderItem.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    flash.notice = "Order number #{@order.id} removed!"

    redirect_to admin_orders_path
  end

end
