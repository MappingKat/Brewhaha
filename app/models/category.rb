class Category < ActiveRecord::Base

  has_many :items

  validates :name, 
            presence: true,
            uniqueness: true
  validates :description, 
            presence: true
  validates :sort_order, 
            uniqueness: true
end
