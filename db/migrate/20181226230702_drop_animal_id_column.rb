class DropAnimalIdColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :point_values, :animal_id
  end
end
