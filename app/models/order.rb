class Order < ActiveRecord::Base

  belongs_to :customers
  belongs_to :addresses
  has_many   :order_items

  validates :status, presence: true
  validates :customer_id, presence: true

  def create_order_items
    Cart.new(session[:cart]).cart_items.each do |ci|
      OrderItem.create(
          :item_id => ci.item_id,
          :quantity => ci.quantity,
          :price => ci.item.price,
          :order_id => id
        )
    end
    session[:cart] = nil
  end

end
