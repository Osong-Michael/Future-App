class CarsController < ApplicationController
  before_action :require_user

  def new
    @car = Car.new
  end
  
  def create
    @brand = Brand.find(params[:car][:brand_id])
    @car = current_user.cars.new(car_params)
    @car.brand_id = @brand.id 
    if @car.save 
      flash[:notice] = 'You have successfully added a new car to your collection'
      redirect_to @brand 
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
  
  

  private 

  def car_params
    params.require(:car).permit(:name, :image, :year, :model, :bought, :brand_id, :user_id)
  end
  

end
