class Order < ActiveRecord::Base

  belongs_to :customer
  has_many :order_items

  validates :status, presence: true

end
