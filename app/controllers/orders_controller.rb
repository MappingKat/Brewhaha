class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
    redirect_to orders_path  
  end

  def show
    @order = Order.find(paramp[:id])
    redirect_to order_path
  end

  def new
    @order = Order.new
    redirect_to edit_order_path
  end

  def edit
    @order = Order.find(params[:id])
    redirect_to edit_order_path
  end

  # def create
  #   @order = Order.new(item_params)
  #   if @order.save
  #     current_cart = nil
  #     redirect_to '/', notice: 'order was successfully created.'
  #   else
  #     redirect_to '/', notice: 'ERROR: order was not created.'
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @order.update(order_params)
  #       format.html { redirect_to @order, notice: 'order was successfully updated.' }
  #     else
  #       format.html { render action: 'edit' }
  #     end
  #   end
  # end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:customer_id, :status)
    end
end

end