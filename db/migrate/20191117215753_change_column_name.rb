class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :requires_packaging, :cook_provides_packaging
  end
end
