class TravelsController < ApplicationController
  before_action :set_travel, only: [:show, :show_to_moto, :edit, :update, :destroy]

  def index
  end

  def new
  end

  def show
    @patients = @travel.patients
    @patient = Patient.new
    @travels = current_user.travels
  end


  def create
    @date = params[:travel]["hr_final(1i)"] + "-" + params[:travel]["hr_final(2i)"] + "-" +  params[:travel]["hr_final(3i)"]
    @travel = Travel.new(travel_params)
    @rotum = Route.find(params[:route_id])
    @travel.route = @rotum
    @travel.status = params[:travel][:status]
    @vehicle = Vehicle.find(params[:travel][:vehicle])
    @travel.hr_final = @date.to_date
    @travel.month = @date.to_date.month
    if @travel.save!
      #redirect_to travel_path(@travel)
      TravelVehicle.create(travel:@travel, vehicle:@vehicle)
      flash[:alert] = "Viagem Criada com sucesso"
      redirect_to route_path(@rotum)
    else
      flash[:alert] = "Erro"
    end
  end

  def viagem
    @travel = current_user.travels
  end

  private

  def travel_params
    params.require(:travel).permit(:status, :route_id, :hr_partida, :hr_volta)
  end

  def set_travel
    @travel = Travel.find(params[:id])
  end
end
