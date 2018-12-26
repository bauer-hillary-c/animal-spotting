class AddAnimalReference < ActiveRecord::Migration[5.0]
  def change
    add_reference :point_values, :animal
  end
end
