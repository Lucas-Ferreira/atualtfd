class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :offline ]

  def home
      if current_user.role == false
        render "moto"
      end
      @users = User.all
      @vehicles = Vehicle.all
      @vliberado = Vehicle.where(status:"Liberado")
      @vmanutencao = Vehicle.where(status:"Manutencão")
    #binding.irb
  end

  def moto
  end

  def offline
    render 'offline', layout: false
  end
end
