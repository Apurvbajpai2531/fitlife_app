class AddDetailsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :goal, :string
  end
end
