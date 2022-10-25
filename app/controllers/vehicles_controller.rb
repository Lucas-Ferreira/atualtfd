class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  def index
    @vehicles = Vehicle.all
  end

  def show

  end

  def new
    @vehicle = Vehicle.new
    @vehicles = Vehicle.all
    @array = User.where(role: "false")
    @array_motorista = []
    @array.each {|n| @array_motorista << n.email}
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    #@vehicle.user_id = 1
    @vehicle.user_id = current_user.id
    if @vehicle.save!
      redirect_to vehicles_path, notice: "Criado com sucesso"
    else
      render :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notice: "Vehicle was sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @vehicle.destroy
    redirect_to root_path, notice: "Veículo deletado com sucesso"
  end

  private

  def vehicle_params
    params.permit(:montadora, :modelo, :ano, :placa, :capacidade, :status, :user_id, :account_id, :motorista)
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
