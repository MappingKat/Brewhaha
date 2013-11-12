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
    drinks = session[:drinks] || []
    if current_customer.bac?
      BloodAlcohol.content(drinks, current_customer.id)
    else
      "Cannot Calculate"
    end
  end

end
