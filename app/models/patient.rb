class Patient < ApplicationRecord
  has_many :confirmations
  has_many :travels, through: :confirmations
  has_many :routes, through: :travels
  validates :name, presence: true
end
