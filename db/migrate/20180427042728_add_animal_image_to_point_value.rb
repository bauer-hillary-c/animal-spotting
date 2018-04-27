class AddAnimalImageToPointValue < ActiveRecord::Migration[5.0]
  def change
    add_reference :point_values, :animal_image, foreign_key: true
  end
end
