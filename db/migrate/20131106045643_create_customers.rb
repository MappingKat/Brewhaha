class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :display_name
      t.string :password
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
