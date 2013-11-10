class AdminOrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end
  
  def add
    current_cart.add_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to root_path
  end

  def subtract
    current_cart.subtract_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to root_path
  end

  def delete
    current_cart.delete_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to root_path
  end

  def destroy
    current_cart.clear
  end
end
