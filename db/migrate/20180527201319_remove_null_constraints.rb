class RemoveNullConstraints < ActiveRecord::Migration[5.0]
  def up
    change_column_null(:animals, :name, true)

    change_column_null(:point_values, :animal_id, true)
    change_column_null(:point_values, :points, true)
    change_column_null(:point_values, :created_by_id, true)

    change_column_null(:scores, :game_id, true)
    change_column_null(:scores, :user_id, true)
    change_column_null(:scores, :points, true)
  end

  def down
    change_column_null(:animals, :name, false)

    change_column_null(:point_values, :animal_id, false)
    change_column_null(:point_values, :points, false)
    change_column_null(:point_values, :created_by_id, false)

    change_column_null(:scores, :game_id, false)
    change_column_null(:scores, :user_id, false)
    change_column_null(:scores, :points, false)
  end
end
