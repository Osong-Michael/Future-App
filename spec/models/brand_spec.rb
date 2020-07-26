require 'rails_helper'

RSpec.describe Brand, type: :model do
  describe 'Brand has many cars' do
    it { should have_many(:cars) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:brand_name) }
    it { should validate_presence_of(:image) }
  end
end
