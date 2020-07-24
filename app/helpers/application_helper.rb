module ApplicationHelper

  def status(car) 
    if car.bought == false
      'Grind harder'
    else
      'Great Job Achieving this Dream'
    end
  end
end
