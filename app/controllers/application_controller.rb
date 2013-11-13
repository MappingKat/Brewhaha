class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_customer
    @current_customer ||= Customer.find(session[:customer_id]) if session[:customer_id]
  end
  helper_method :current_customer

  def current_cart
    cart = session[:cart] || {}
    @current_cart ||= Cart.new(cart)
  end
  helper_method :current_cart

  def admin?
    if current_customer != nil
      current_customer.admin == true
    else
      false
    end
  end
  helper_method :admin?

  def authorized_admin?
    unless admin?
      redirect_to root_path, notice: 'Not logged in as admin.'
    end
  end

  def logged_in?
    unless current_customer
      redirect_to root_path, notice: 'You must log in to continue.'
    end
  end

  def blood_alcohol
    if current_customer.bac?
      BloodAlcohol.content(current_customer_drinks, current_customer.id)
    else
      "Cannot Calculate"
    end
  end
  helper_method :blood_alcohol

  def current_customer_drinks
    if current_customer
      orders = current_customer.orders.find_all { |o| o.created_at.to_i - 1.days.ago.to_i > 0 && o.status == "paid"}
      orders.map { |o| o.my_drinks }.flatten
    else
      []
    end
  end
end
