module CarsHelper
  def buy(car)
    if current_user == car.user && car.bought == false
      link_to 'I own it NOW!!!', car_owns_path(car), class: 'own-it'
    end
  end

  def edit_btn(car)
    if car.bought == false && current_user == car.user
      link_to 'Edit Car Details', edit_car_path(car)
    end
  end
end
