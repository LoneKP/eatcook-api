class AddPickupTimeToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :pickup_time, :datetime
  end
end
