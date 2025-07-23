json.extract! schedule, :id, :workout_id, :user_id, :scheduled_on, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
