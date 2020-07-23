class Car < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :brand
  validates :name, :model, :year, presence: true
end
