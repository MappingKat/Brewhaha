class Address < ActiveRecord::Base
  belongs_to :customers
  has_many :orders
end
