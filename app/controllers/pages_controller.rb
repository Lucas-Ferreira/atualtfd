class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @users = User.all
    @vehicles = Vehicle.all
    @vliberado = Vehicle.where(status:"Liberado")
    @vmanutencao = Vehicle.where(status:"Manutencão")
  end
end
