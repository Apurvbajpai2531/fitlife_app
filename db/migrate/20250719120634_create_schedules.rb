class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :workout, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :scheduled_on

      t.timestamps
    end
  end
end
