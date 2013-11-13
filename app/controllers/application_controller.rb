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

  def blood_alcohol
    if current_customer.bac?
      find_current_customer_drinks
      BloodAlcohol.content(session[:drinks], current_customer.id)
    else
      "Cannot Calculate"
    end
  end
  helper_method :blood_alcohol

  def find_current_customer_drinks
    session[:drinks].nil? ? [] : session[:drinks]
    if current_customer
      orders = current_customer.orders.find_all { |o| o.created_at.to_i < 2.days.ago.to_i }
      binding.pry
      # current_customer.orders.each { |o| session[:drinks] += o.my_drinks }
    end
  end

end
