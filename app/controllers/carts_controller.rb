class CartsController < ApplicationController

  def add
    current_cart.add_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to :back
  end

  def subtract
    current_cart.subtract_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to :back
  end

  def delete
    current_cart.delete_item(params[:id])
    session[:cart] = current_cart.to_h
    redirect_to :back
  end

  def destroy
    current_cart.clear
    session[:cart] = current_cart.to_h
    redirect_to '/'

  end

  def review
    render :review
  end

end
