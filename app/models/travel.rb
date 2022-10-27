class Travel < ApplicationRecord
  belongs_to :route
  has_many :travel_vehicles, dependent: :destroy
  has_many :vehicles, through: :travel_vehicles
  has_many :confirmations, dependent: :destroy
  has_many :patients, through: :confirmations
  acts_as_tenant(:account)
end
