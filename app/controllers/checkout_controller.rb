class CheckoutController < ApplicationController

  def show
  end

  def create
    @order = Order.new(item_params)
    if @order.save
      current_cart = nil
      redirect_to '/', notice: 'Order was successfully created!'
    else
      redirect_to '/', notice: 'ERROR: order was not created.'
    end
  end

end
