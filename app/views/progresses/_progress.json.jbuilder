json.extract! progress, :id, :weight, :bmi, :calories_burned, :user_id, :created_at, :updated_at
json.url progress_url(progress, format: :json)
