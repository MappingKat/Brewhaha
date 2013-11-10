class AdminController < ApplicationController
  def show
    @orders = Order.all 
  end

  def index
    @cart_hash = Cart.all
  end
end
