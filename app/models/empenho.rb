class Empenho < ApplicationRecord
  belongs_to :user
  belongs_to :account
  acts_as_tenant(:account)
end
