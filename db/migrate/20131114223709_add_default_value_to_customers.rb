class AddDefaultValueToCustomers < ActiveRecord::Migration
  def change
    change_column :customers, :weight, :integer, :default => 130
    change_column :customers, :sex, :string, :default => "male"
  end
end
