class AddReferencesToPickups < ActiveRecord::Migration[6.0]
  def change
    add_reference :pickups, :meal, null: false, foreign_key: true
    add_reference :pickups, :order, null: false, foreign_key: true
  end
end
