class RemovePasswordFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :password, :string
    remove_column :customers, :email, :string
    remove_column :customers, :first_name, :string
    remove_column :customers, :last_name, :string
    add_column :customers, :image, :string
    add_column :customers, :name, :string
  end
end
