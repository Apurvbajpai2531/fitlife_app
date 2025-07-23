class AddPlanToWorkouts < ActiveRecord::Migration[8.0]
  def change
    add_reference :workouts, :plan, null: false, foreign_key: true
  end
end
