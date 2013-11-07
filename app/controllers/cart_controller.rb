class CartController < ApplicationController
  def add
    @item = Item.find(params[:id])
  end

end
