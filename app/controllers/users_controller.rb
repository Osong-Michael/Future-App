class UsersController < ApplicationController
  def homepage
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      flash[:success] = 'You account has been successfully created'
      redirect_to @user 
    else
      flash.now[:alert] = 'Username already taken'
      render :new 
    end
  end

  def show 
    @user = current_user
    user_all_cars = @user.cars
    @owned = user_all_cars.count{ |car| car.bought == true }
    @not_owned = user_all_cars.count{ |car| car.bought == false }
    case params[:filter]
    when 'owned'
      @users_cars = @user.cars.owned_cars
    when 'fly'
      @users_cars = @user.cars.work_harder
    else
      @users_cars= @user.cars
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = 'You account has been successfully updated'
    redirect_to @user
  end

  private 

  def user_params
    params.require(:user).permit(:username, :image, :image_cache )
  end
  
end