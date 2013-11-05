class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.boolean :available
      t.string :name
      t.text :description
      t.integer :sort_order

      t.timestamps
    end
  end
end
