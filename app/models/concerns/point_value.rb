class PointValue < ApplicationRecord
  belongs_to :animals
  has_one :animal_image
end
