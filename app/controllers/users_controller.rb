class UsersController < ApplicationController
  before_action :set_params, except: %i[new create]
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
    @owned = user_all_cars.count { |car| car.bought == true }
    @not_owned = user_all_cars.count { |car| car.bought == false }
    @users_cars = case params[:filter]
                  when 'achieved'
                    @user.cars.owned_cars
                  when 'pending'
                    @user.cars.work_harder
                  else
                    @user.cars
                  end
  end

  def edit; end

  def update
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:username, :image, :image_cache)
  end

  def set_params
    @user = current_user
  end
end
