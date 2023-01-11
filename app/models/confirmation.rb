class Confirmation < ApplicationRecord
  belongs_to :patient
  belongs_to :travel
  acts_as_tenant(:account) 
end
