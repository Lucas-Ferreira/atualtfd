class Empenho < ApplicationRecord
  belongs_to :user
  belongs_to :account
end
