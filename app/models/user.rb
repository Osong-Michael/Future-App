class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :username, presence: true, uniqueness: true
  has_many :brands
end
