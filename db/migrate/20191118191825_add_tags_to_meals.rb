class AddTagsToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :tags, :string, array: true, default: []
  end
end

