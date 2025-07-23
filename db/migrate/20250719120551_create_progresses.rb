class CreateProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :progresses do |t|
      t.float :weight
      t.float :bmi
      t.integer :calories_burned
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
