class Car < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :brand
  validates :name, :model, :year, presence: true
  validates :image, presence: true

  scope :owned_cars, -> { where(:bought => true)}
  scope :work_harder, -> { where(:bought => false)}
  # Ex:- scope :active, -> {where(:active => true)}
end
