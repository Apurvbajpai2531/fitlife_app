class Workout < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  belongs_to :plan, optional: true

  # Ransack: explicitly allow these attributes to be searchable
  def self.ransackable_attributes(auth_object = nil)
    [ "title", "description", "user_id", "category_id", "plan_id", "created_at", "updated_at" ]
  end
end
