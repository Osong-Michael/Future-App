module ApplicationHelper

  def status(car) 
    if car.bought == false
      'Grind harder'
    else
      'Great Job Achieving this Dream'
    end
  end

  def user_links
    if logged_in?
      render 'layouts/usernav'
    end
  end
end
