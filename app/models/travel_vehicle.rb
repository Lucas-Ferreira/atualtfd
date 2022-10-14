class TravelVehicle < ApplicationRecord
  belongs_to :travel
  belongs_to :vehicle
end
