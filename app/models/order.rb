class Order < ActiveRecord::Base

  has_many :order_items

  validates :status, presence: true

end
