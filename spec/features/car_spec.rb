require 'rails_helper'

describe "Adding a new car to collection" do 
  before do 
    visit root_path

    fill_in "Username", with: "James"
    click_button 'Sign Up'
  end

  it "Take the user to the car creation page" do
    click_link 'Add New Car to Collection'

    expect(current_path).to eq(new_car_path)
  end

  it "Does not create brand without valid input" do
    click_link 'Add New Car to Collection'
    click_button 'Add Car'

    expect(current_path).to eq(cars_path)
  end
end
