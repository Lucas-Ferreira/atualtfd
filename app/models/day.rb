class Day < ApplicationRecord
  belongs_to :route
  belongs_to :travel
  acts_as_tenant(:account) 
end
