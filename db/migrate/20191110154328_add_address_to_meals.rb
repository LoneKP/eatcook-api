class AddAddressToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :address, :string
    add_column :meals, :zip, :integer
    add_column :meals, :city, :string
  end
end
