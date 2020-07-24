class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]
  
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      session[:user_id] = user.id
      redirect_to user, notice: "You are signed in #{user.username}"
    else
      flash.now[:notice] = 'Your are not a user'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to login_path
  end

  private 

  def already_logged_in
    if logged_in?
      flash[:error] = 'Your are already logged in'
      redirect_to root_path 
    end
  end
end
