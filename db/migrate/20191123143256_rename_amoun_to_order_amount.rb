class RenameAmounToOrderAmount < ActiveRecord::Migration[6.0]
  def change
    rename_column :pickups, :amount, :order_amount 
  end
end
