class OrderItem < ActiveRecord::Base

  belongs_to :orders
  belongs_to :item

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

  def subtotal
    quantity * price
  end

  def currency
     ActionController::Base.helpers.number_to_currency(subtotal * 0.01)
  end

end
