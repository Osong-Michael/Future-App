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

  def congrats(owned, not_owned)
    if not_owned == 0 && owned > 1
      'Congratulations On Achieving all your dreams'
    end
  end
end
