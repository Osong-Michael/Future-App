module ApplicationHelper

  def status(car) 
    if car.bought == false
      'You need to grind harder'
    end
  end
end
