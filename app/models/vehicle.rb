class Vehicle < ApplicationRecord
  #belongs_to :user, optional: true
  has_many :route_vehicles
  has_many :routes, through: :route_vehicles
  has_many :travel_vehicles
  has_many :travel, through: :travel_vehicles
  validates :modelo, presence: true
  validates :ano, presence: true
end
