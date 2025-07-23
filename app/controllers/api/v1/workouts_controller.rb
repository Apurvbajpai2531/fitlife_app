# app/controllers/api/v1/workouts_controller.rb
class Api::V1::WorkoutsController < ApplicationController
  def index
    render json: current_user.workouts
  end
end
