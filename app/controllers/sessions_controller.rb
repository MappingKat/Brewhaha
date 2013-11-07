class SessionsController < ApplicationController

  def create
    customer = Customer.from_omniauth(env['omniauth.auth'])
    # self.current_customer = @customer
    session[:customer_id] = customer.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:customer_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

end
