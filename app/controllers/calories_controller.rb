class CaloriesController < ApplicationController

  def index
    if current_user
      @current_user = current_user
      @calories = @current_user.calories.order(:created_at).page params[:page]
      daily_count(@current_user)
    end 
  end

  def new
    @calorie = Calorie.new
  end

  def create
    puts"----------------------------------"
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts params[:commit]
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts"----------------------------------"
    @user = current_user
    @calorie = @user.calories.new(calorie_params)
    @calorie.update_attribute("c_type", params[:commit].downcase)
    puts"----------------------------------"
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts @calorie.c_type
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts"----------------------------------"
    if @calorie.save
      #Cuenta 1 vez que se hize un registro
      user_registries_counter(@current_user)
      #Revisa si hay que agregar al consolidado del día
      daily_count(@current_user)
      #Redireccciona
      redirect_to action: "index"
      #Avisa
      flash[:success] = "Your calories were saved successfully!"
    else
      # flash[:danger] = "Your calorie is more than 140 characters, please try making it shorter"
      # redirect_to new_calorie_path(@calorie)
      render :new
      flash[:danger] = "Your calories entry is invalid"
    end
  end

  def edit
    @calorie = Calorie.find(params[:id])
  end

  def update
    @calorie = Calorie.find(params[:id])
    if @calorie.update(calorie_params)
      @calorie.update_attribute("c_type", params[:commit].downcase)
      redirect_to root_path
    else
      render :edit
    end 
  end

  def destroy
    @calorie = Calorie.find(params[:id])
    @calorie.destroy
    redirect_to root_path
  end

  def show
    @calorie = Calorie.find(params[:id])
  end

  private

  def calorie_params
    params.require(:calorie).permit(:number, :content, :date, :c_type)
  end

def user_registries_counter(user)
    user.registries ||= 0
    memo = user.registries + 1
    user.update_attribute("registries", memo)
    puts"----------------------------------"
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts" Imprimiendo user.registries: #{memo}"
    puts"<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>"
    puts"----------------------------------"
  end
  def daily_count(user)
    @consolidated_day_array = []
    @daily_count_consumed = 0
    @daily_count_burnt = 0
    calories = user.calories
    calories.each do |calorie|
      if calorie.c_type == "burnt"
        if Date.current - 1  < calorie.created_at &&
            Date.current + 1  > calorie.created_at
            @daily_count_burnt += calorie.number
        end 
      end
      if calorie.c_type == "consumed"
        if Date.current - 1  < calorie.created_at &&
            Date.current + 1  > calorie.created_at
            @daily_count_consumed += calorie.number
        end 
      end
    end
      puts"---------------------------------------"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"Consolidado del día de burnt:#{@daily_count_burnt}"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"---------------------------------------"
      puts"                                       "
      puts"                                       "
      puts"                                       "
      puts"---------------------------------------"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"Consolidado del día de consumed:#{@daily_count_consumed}"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"---------------------------------------"
      puts"                                       "
    @consolidated_day_array << @daily_count_burnt
    @consolidated_day_array << @daily_count_consumed
      puts"                                       "
      puts"                                       "
      puts"---------------------------------------"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"Consolidated day array:#{@consolidated_day_array}"
      puts"<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>"
      puts"---------------------------------------"
    @consolidated_day_array
  end
end
