class Order < ActiveRecord::Base

  belongs_to :customers
  belongs_to :addresses
  has_many   :order_items

  validates :status, presence: true
  validates :customer_id, presence: true

end
