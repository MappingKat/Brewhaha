class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm, :complete]
  before_action :authorized_admin?, only: [:edit, :update]
  before_action :logged_in?, only: [:index, :show, :new, :create, :destroy]

  def index
    if current_customer.admin
      @orders = Order.all
    elsif current_customer
      @orders = Order.where(:customer_id => current_customer.id, :status => "paid")
    else
      @orders = nil
    end
  end

  def show
    if @order.customer_id == current_customer.id
      @order
    else
      redirect_to root_path, notice: 'Not your order.'
    end
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
      @order.create_order_items(Cart.new(session[:cart]))
      session[:cart] = nil
      redirect_to pay_for_order_path(@order.id), notice: 'Order was successfully created.'
    else
      redirect_to '/', notice: 'ERROR: order was not created.'
    end
  end

  def complete
    @order.status = "paid"
    @order.save
    redirect_to '/', notice: 'Order complete - Thank you!'
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
