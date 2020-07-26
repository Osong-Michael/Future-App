require 'rails_helper'

describe 'Signing In a new User' do
  before do
    visit root_path

    fill_in 'Username', with: 'James'
    click_button 'Sign Up'
  end

  it 'Whe a user signs up it takes them to user show page' do
    visit user_path(User.last)

    expect(current_path).to eq(user_path(User.last))
  end
end

describe 'A user adding a new brand' do
  before do
    visit root_path

    fill_in 'Username', with: 'James'
    click_button 'Sign Up'
  end

  it 'Take the user to the brand creation page' do
    visit brands_path

    click_link 'Add New Brand'

    expect(current_path).to eq(new_brand_path)
  end

  it 'Does not create brand without valid input' do
    visit brands_path

    click_link 'Add New Brand'
    click_button 'Add Brand'

    expect(current_path).to eq(brands_path)
  end
end
