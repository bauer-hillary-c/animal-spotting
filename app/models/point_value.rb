class PointValue < ApplicationRecord
  belongs_to :animal, optional: true
  belongs_to :animal_image
end
