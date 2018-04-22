class CreatesPointValues < ActiveRecord::Migration[5.0]
  def change
    create_table :point_values do |t|
      t.references :animal, index: true, null: false
      t.integer :points, null: false
      t.references :created_by, references: :users, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :point_values, :animals, on_delete: :cascade
  end
end
