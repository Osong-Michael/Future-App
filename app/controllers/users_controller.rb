class UsersController < ApplicationController
  before_action :set_params, except: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to @user 
    else
      render :new 
    end
  end

  def show 
    user_all_cars = @user.cars
    @owned = user_all_cars.count{ |car| car.bought == true }
    @not_owned = user_all_cars.count{ |car| car.bought == false }
    case params[:filter]
    when 'achieved'
      @users_cars = @user.cars.owned_cars
    when 'pending'
      @users_cars = @user.cars.work_harder
    else
      @users_cars= @user.cars
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private 

  def user_params
    params.require(:user).permit(:username, :image, :image_cache )
  end

  def set_params
    @user = current_user
  end
  
end