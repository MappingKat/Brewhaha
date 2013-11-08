class CartsController < ApplicationController

  def add
    puts cart_params.inspect
    # current_cart.add_item(cart_params)
  end

  def subtract
  end

  def delete
  end

  def destroy
    current_cart.clear
  end

private

  def cart_params
      params.require(:cart_item).permit(:item_id)
  end

end
