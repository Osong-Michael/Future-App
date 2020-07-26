require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User can create many cars' do
    it { should have_many(:cars) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:username) }
  end
end
