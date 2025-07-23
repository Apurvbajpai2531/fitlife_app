class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workout, only: %i[ show edit update destroy ]

  # GET /workouts
  def index
    @q = Workout.ransack(params[:q])
    @workouts = @q.result.where(user_id: current_user.id)
  end

  # GET /workouts/1
  def show
    # Nothing extra needed here unless you want to show more stats
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end


  def edit
  end


  def create
    @workout = current_user.workouts.new(workout_params)

    if @workout.save

      if current_user.workouts.count == 10 && !current_user.achievements.exists?(title: "10 Workouts")
        current_user.achievements.create(
          title: "10 Workouts",
          description: "Completed 10 workouts!"
        )
      end

      redirect_to @workout, notice: "Workout created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end


  def update
    if @workout.update(workout_params)
      redirect_to @workout, notice: "Workout was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout was successfully destroyed.", status: :see_other
  end

  private


    def set_workout
      @workout = current_user.workouts.find(params[:id])
    end

    def workout_params
  params.require(:workout).permit(:title, :description, :category_id, :plan_id)
end
end
