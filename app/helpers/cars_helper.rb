module CarsHelper
  def buy(car)
    link_to 'I own it NOW!!!', car_owns_path(car), class: 'own-it' if current_user == car.user && car.bought == false
  end

  def edit_btn(car)
    link_to 'Edit Car Details', edit_car_path(car) if car.bought == false && current_user == car.user
  end
end
