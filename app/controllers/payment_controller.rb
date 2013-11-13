class PaymentController < ApplicationController
  def index
    logged_in?
  end

  def confirm
    logged_in?
  end
end
