module ApplicationHelper
  def status(car)
    if car.bought == false
      'Grind harder'
    else
      'Great Job Achieving this Dream'
    end
  end

  def user_links
    render 'layouts/usernav' if logged_in?
  end

  def congrats(owned, not_owned)
    'Congratulations On Achieving all your dreams' if not_owned.zero? && owned >= 1
  end
end
