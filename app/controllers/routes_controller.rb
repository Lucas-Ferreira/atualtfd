class RoutesController < ApplicationController
  before_action :set_rotum, only: [:show, :edit, :update, :destroy]
  def index
    @rotums = Route.all
  end

  def show
    @rotum_run = @rotum.travels.where.not(status:"Finalizado")
    @rotum_history = @rotum.travels.where(status:"Finalizado")
    @travel = Travel.new
  end

  def new
    @rotum = Route.new
    @rotums = Route.last
  end

  def create
    @rotum = Route.new(rotum_params)
    if @rotum.save
      redirect_to routes_path, notice: "Criado com sucesso"
    else
      render :new
    end
  end

  def destroy
    @rotum.destroy
    redirect_to routes_path, notice: "Veículo deletado com sucesso"
  end

  private

  def rotum_params
    params.require(:route).permit(:origem, :destino, :vehicle, :capacidade, :especialidade, :account_id)
  end

  def set_rotum
    @rotum = Route.find(params[:id])
  end

end
