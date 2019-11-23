class CreatePickups < ActiveRecord::Migration[6.0]
  def change
    create_table :pickups do |t|
      t.string :name
      t.datetime :pickup_time
      t.boolean :cook_provides_packaging
      t.integer :amount
      t.string :description
      t.string :address
      t.integer :zip
      t.string :city
      t.string :tags, default: [], array: true
      t.timestamps
    end
  end
end

