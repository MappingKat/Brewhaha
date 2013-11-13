class SessionsController < ApplicationController

  def create
    customer = Customer.from_omniauth(env['omniauth.auth'])
    # self.current_customer = @customer
    session[:customer_id] = customer.id
    redirect_to '/', notice: "Signed in!"
  end

  def destroy
    session[:customer_id] = nil
    session[:drinks] = nil
    redirect_to '/', notice: "Signed out!"
  end

end
