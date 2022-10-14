class Confirmation < ApplicationRecord
  belongs_to :patient
  belongs_to :travel
end
