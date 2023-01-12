class EmpenhosController < ApplicationController
  before_action :set_motorista, only: [:create, :update]
  before_action :set_empenho, only: [:show, :edit, :update, :destroy]

  def index
    @empenhos = Empenho.all
  end

  def show
  end

  def new
    @empenho = Empenho.new
    @array = User.where(role: "false")
    @array_motorista = []
    @array.each {|n| @array_motorista << n.email}
  end

  def create
    @empenho = Empenho.new(empenho_params)
    @empenho.user = current_user
    @empenho.date = Time.now
    @empenho.account_id = ActsAsTenant.current_tenant.id
    if @empenho.save!
      if @motorista.saldos[0].nil?
        @total = 0 + params[:empenho][:valor].to_f
        Saldo.create!(saldo_total: @total, aporte_total: @total, user_id: @motorista.id)
      else
        @empenhos = Empenho.where(motorista: @motorista.email)
        @total = 0
        @aporte_total = 0
        @total = @motorista.saldos[0].saldo_total + params[:empenho][:valor].to_f
        @empenhos.each do |e|
        @aporte_total = @aporte_total + e.valor
        end
        @motorista.saldos[0].update!(saldo_total: @total, aporte_total: @aporte_total)
      end
    redirect_to empenhos_path
    end
  end

  def edit
    @array = User.where(role: "false")
    @array_motorista = []
    @array.each {|n| @array_motorista << n.email}
  end

  def update
    @empenho.update!(empenho_params)
    @total = @motorista.saldos[0].saldo_total - @empenho.valor
    @motorista.saldos[0].update!(saldo_total: @total)
    #@empenho.update!(valor: params["empenho"]["valor"], motorista: ["empenho"]["motorista"])
    redirect_to empenhos_path
  end

  def destroy
    raise
  end

  def saldo
    @saldos = User.where(role: false)
  end

  private

  def empenho_params
    params.require(:empenho).permit(:valor, :motorista, :status, :number)
  end

  def set_motorista
    @motorista = User.find_by_email(params[:empenho][:motorista])
  end

  def set_empenho
    @empenho = Empenho.find(params[:id])
  end
end
