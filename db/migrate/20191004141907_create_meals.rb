class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.datetime :pickup_time
      t.boolean :requires_packaging
      t.integer :amount

      t.timestamps
    end
  end
end
