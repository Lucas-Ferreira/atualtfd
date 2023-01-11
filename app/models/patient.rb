class Patient < ApplicationRecord
  has_many :confirmations, dependent: :delete_all
  has_many :travels, through: :confirmations
  has_many :routes, through: :travels
  validates :name, presence: true
  acts_as_tenant(:account)
end
