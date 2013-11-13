class AddAlcoholToItems < ActiveRecord::Migration
  def change
    add_column :items, :abv, :decimal
    add_column :items, :volume, :decimal
  end
end
