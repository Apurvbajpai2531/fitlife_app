class ChangeCategoryIdToBeNullableInWorkouts < ActiveRecord::Migration[7.0]
  def change
    change_column_null :workouts, :category_id, true
  end
end
