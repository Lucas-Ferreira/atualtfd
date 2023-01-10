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
      if current_user.saldos[0].nil?
        redirect_to travel_path(@travel), notice: "Você não tem saldo para decrementar"
      else
        current_user.saldos[0].update!(saldo_total: current_user.saldos[0].saldo_total - params[:comprovante][:valor].to_f)
      redirect_to travel_path(@travel), notice: "Comprovante adicionado com sucesso"
      end
    else
    end
end

private

def comprovante_params
  params.permit(:valor, :categoria, :travel)
end
end
