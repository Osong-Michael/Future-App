class BrandsController < ApplicationController
  before_action :require_user
  
  def index 
    @brands = Brand.all
  end


  def new
    @brand = Brand.new
  end

  def create
    @brand = current_user.brands.new(brand_params)
    if @brand.save 
      flash[:notice] = 'You successfully added another brand'
      redirect_to @brand
    else
      flash.now[:notice] = 'Brand already exists'
      render :new 
    end
  end

  def show
    @brand = Brand.find(params[:id])
    @brand_cars = @brand.cars.includes(:user)
  end

  def edit
    @brand = Brand.find(params[:id]) 
  end

  def update 
    @brand = Brand.find(params[:id])
    @brand.update(brand_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to @brand 
  end


  private

  def brand_params
    params.require(:brand).permit(:brand_name, :image, :image_cache)
  end
  
  
  
end