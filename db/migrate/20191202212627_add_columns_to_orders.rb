class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :amount, :integer
    add_column :orders, :address, :string
    add_column :orders, :city, :string
    add_column :orders, :zip, :integer
  end
end
