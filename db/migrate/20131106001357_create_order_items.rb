class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :item
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
