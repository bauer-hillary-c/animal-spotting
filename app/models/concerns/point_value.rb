class PointValue < ApplicationRecord
  belongs_to :animal
  has_one :animal_image
end
