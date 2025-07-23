class ChangePlanIdNullOnWorkouts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :workouts, :plan_id, true
  end
end
