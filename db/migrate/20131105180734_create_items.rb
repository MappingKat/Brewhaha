class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.boolean :available
      t.string :name
      t.text :description
      t.integer :price
      t.integer :cost
      t.references :category, index: true
      t.integer :sort_order

      t.timestamps
    end
  end
end
