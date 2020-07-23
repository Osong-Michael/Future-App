class UsersController < ApplicationController

  def homepage
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save 
      flash[:success] = 'You account has been successfully created'
      redirect_to @user 
    else
      flash.now[:alert] = 'Username already taken'
      render :new 
    end
  end

  def show 
    @user = User.find(params[:id])
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
    params.require(:user).permit(:username, :image)
  end
  
end