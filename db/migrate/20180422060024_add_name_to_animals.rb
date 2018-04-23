class AddNameToAnimals < ActiveRecord::Migration[5.0]
  def change
    add_column :animals, :name, :string, null: false
  end
end
