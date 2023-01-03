class ComprovantesController < ApplicationController

def index
end

def create
  @comprovante = Comprovante.new(comprovante_params)
  @travel = Travel.find(params[:comprovante][:travel])
  @comprovante.valor = params[:comprovante][:valor]
  @comprovante.categoria = params[:comprovante][:categoria]
  @comprovante.travel = @travel
  @comprovante.user_id = current_user.id
    if @comprovante.save
      current_user.saldos[0].update!(saldo_total: current_user.saldos[0].saldo_total - params[:comprovante][:valor].to_f)
      redirect_to travel_path(@travel)
    else

    end
  raise
end

private

def comprovante_params
  params.permit(:valor, :categoria, :travel)
end
end
