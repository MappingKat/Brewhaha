class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def show
    @order = O
  end

  def new
    @order = Order.new
  end

  def edit
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(:status => "pending", :customer_id => session[:customer_id])
    if @order.save
      @order.create_order_items
      redirect_to confirm_order_path(@order.id), notice: 'Order was successfully created.'
    else
      redirect_to '/', notice: 'ERROR: order was not created.'
    end
  end

  def confirm
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @order.destroy
    redirect_to items_url
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
