class Route < ApplicationRecord
  has_many :routes
  has_many :days
  has_many :route_vehicles, dependent: :delete_all
  has_many :vehicles, through: :route_vehicles, dependent: :delete_all
  has_many :travels, dependent: :delete_all
  validates :origem, presence: true
  validates :destino, presence: true
end
