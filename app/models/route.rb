class Route < ApplicationRecord
  has_many :routes
  has_many :days
  has_many :route_vehicles
  has_many :vehicles, through: :route_vehicles
  has_many :travels, dependent: :destroy
  validates :origem, presence: true
  validates :destino, presence: true
  acts_as_tenant(:account)
end
