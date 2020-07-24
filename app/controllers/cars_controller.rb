class CarsController < ApplicationController
  before_action :require_user

  def new
    @car = Car.new
  end
  
  def create
    if @car.save 
      flash[:notice] = 'You have successfully added a new car to your collection'
      redirect_to user_path(current_user) 
    else 
      flash.now[:notice] = 'Something went wrong'
      render :new 
    end
  end

  def show 
    @car = Car.find(params[:id])
  end

  def edit 
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(car_params)
    flash[:notice] = 'You have successfully updated your dream Car'
    redirect_to @car
  end
  

  def owns 
    @car = Car.find_by(id: params[:car_id])
    @car.update(bought: true)
    redirect_to user_path(current_user) 
  end
  

  private 

  def car_params
    params.require(:car).permit(:name, :image, :year, :model, :bought, :brand_id, :user_id, :car_id)
  end
  

end
