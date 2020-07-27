class BrandsController < ApplicationController
  before_action :require_user
  before_action :set_brand_params, only: %i[show edit update]
  before_action :block_btn, only: [:edit]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = current_user.brands.build(brand_params)
    if @brand.save
      flash[:notice] = 'You successfully added another brand'
      redirect_to @brand
    else
      render :new
    end
  end

  def show
    @brand_cars = @brand.cars.includes(:user)
  end

  def edit; end

  def update
    @brand.update(brand_params)
    flash[:notice] = 'Updated Successfully'
    redirect_to @brand
  end

  private

  def brand_params
    params.require(:brand).permit(:brand_name, :image, :image_cache)
  end

  def set_brand_params
    @brand = Brand.find(params[:id])
  end

  def block_btn
    redirect_to brands_path if current_user != @brand.user
  end
end
