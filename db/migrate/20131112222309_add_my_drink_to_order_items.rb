class AddMyDrinkToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :my_drink, :boolean
  end
end
