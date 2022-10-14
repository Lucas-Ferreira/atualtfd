class Travel < ApplicationRecord
  belongs_to :route
  has_many :travel_vehicles
  has_many :vehicles, through: :travel_vehicles
  has_many :confirmations
  has_many :patients, through: :confirmations
end
