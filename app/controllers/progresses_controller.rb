class ProgressesController < ApplicationController
  before_action :set_progress, only: %i[ show edit update destroy ]


  def index
    @progresses = Progress.all
  end


  def show
  end


  def new
    @progress = Progress.new
  end


  def edit
  end


  def create
    @progress = Progress.new(progress_params)

    respond_to do |format|
      if @progress.save
        format.html { redirect_to @progress, notice: "Progress was successfully created." }
        format.json { render :show, status: :created, location: @progress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progresses/1 or /progresses/1.json
  def update
    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to @progress, notice: "Progress was successfully updated." }
        format.json { render :show, status: :ok, location: @progress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @progress.destroy!

    respond_to do |format|
      format.html { redirect_to progresses_path, status: :see_other, notice: "Progress was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_progress
      @progress = Progress.find(params.expect(:id))
    end


    def progress_params
      params.expect(progress: [ :weight, :bmi, :calories_burned, :user_id ])
    end
end
