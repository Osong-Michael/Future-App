class Brand < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :brand_name, presence: true, uniqueness: true
  validates :image, presence: true
  belongs_to :user
  has_many :cars
end
