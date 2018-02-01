class CaloriesController < ApplicationController

  def index
    # @current_user = current_user
    # @calories = @current_user.calories
  end

  def new
    @calorie = Calorie.new
  end

  def create
    @user = current_user
    @calorie = @user.calories.new(calorie_params)
    if @calorie.save
      redirect_to action: "index"
      flash[:success] = "Your calories was saved successfully!"
    else
      # flash[:danger] = "Your calorie is more than 140 characters, please try making it shorter"
      redirect_to new_calorie_path(@calorie)
      flash[:danger] = "Your calories are invalid"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private

  def calorie_params
    params.require(:calorie).permit(:number, :content, :date, :type)
  end
end
