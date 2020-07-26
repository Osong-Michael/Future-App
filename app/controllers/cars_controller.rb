class CarsController < ApplicationController
  before_action :require_user
  before_action :set_car_params, only: %i[show edit update]
  before_action :block_btn, only: [:edit]
  before_action :block_edit, only: [:edit]

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = 'You have successfully added a new car to your collection'
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
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

  def set_car_params
    @car = Car.find(params[:id])
  end

  def block_btn
    redirect_to user_path(current_user) if current_user != @car.user
  end

  def block_edit
    redirect_to user_path(current_user) if @car.bought == true
  end
end
