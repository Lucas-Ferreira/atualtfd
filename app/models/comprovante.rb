class Comprovante < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  acts_as_tenant(:account) 
end
