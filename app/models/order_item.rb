class OrderItem < ActiveRecord::Base

  belongs_to :orders
  has_one :item

  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :quantity, presence: true
  validates :price, presence: true

end
