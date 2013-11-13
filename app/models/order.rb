class Order < ActiveRecord::Base

  belongs_to :customers
  belongs_to :addresses
  has_many   :order_items

  validates :status, presence: true
  validates :customer_id, presence: true

  def create_order_items(cart)
    this_id = id
    cart.cart_items.each do |ci|
      OrderItem.create(
          :item_id => ci.item_id,
          :quantity => ci.quantity,
          :price => ci.item.price,
          :order_id => this_id
        )
    end
  end

  def total
    order_items.inject(0) { |total, oi| total + oi.subtotal }
  end

  def currency
    ActionController::Base.helpers.number_to_currency(total * 0.01)
  end

  def my_drinks
    #need to add myDrink boolean check
    order_items.map { |oi| {time: oi.created_at, loz: oi.loz_alcohol} }
  end
end
