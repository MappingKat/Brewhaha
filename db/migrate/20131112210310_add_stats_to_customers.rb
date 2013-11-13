class AddStatsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :weight, :integer
    add_column :customers, :sex, :string
  end
end
