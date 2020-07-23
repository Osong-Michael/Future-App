class Brand < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :brand_name, presence: true, uniqueness: true
  belongs_to :user
end
