class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.references :game, index: true, null: false
      t.references :user, index: true, null: false
      t.integer :points, null: false

      t.timestamps null: false
    end

    add_foreign_key :scores, :games, on_delete: :cascade
  end
end
