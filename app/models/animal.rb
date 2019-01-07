class Animal < ApplicationRecord
  has_many :point_values
  has_many :animal_images, through: :point_values
  belongs_to :user

  attr_accessor :points
end
