class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :vehicles, dependent: :destroy
  has_many :travel_vehicles, through: :vehicles
  has_many :travels, through: :travel_vehicles
  belongs_to :account
  has_many :saldos
  acts_as_tenant(:account)
end
