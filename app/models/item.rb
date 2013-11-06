class Item < ActiveRecord::Base

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :cost, presence: true

end
