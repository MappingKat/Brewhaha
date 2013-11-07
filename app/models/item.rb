class Item < ActiveRecord::Base

  belongs_to :category

  validates :name, 
            presence: true, 
            uniqueness: true
  validates :description, 
            presence: true
  validates :price, 
            presence: true
  validates :cost, 
            presence: true
end
