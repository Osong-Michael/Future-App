require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'association with User' do
    it { should belong_to(:user) }
  end

  describe 'association with Brand' do
    it { should belong_to(:brand) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:model) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:image) }
  end
end
