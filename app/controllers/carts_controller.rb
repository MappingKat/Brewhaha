class CartsController < ApplicationController

  def add
    current_cart.add_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to root_path
  end

  def subtract
  end

  def delete
  end

  def destroy
    current_cart.clear
  end

end
