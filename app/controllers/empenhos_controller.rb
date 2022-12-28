class EmpenhosController < ApplicationController
  before_action :set_motorista, only: [:create]

  def index
    @empenhos = Empenho.all
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
      @empenhos = Empenho.where(motorista: @motorista.email)
      @total = 0
      @empenhos.each do |e|
        @total = @total + e.valor
      end
      @motorista.saldos[0].update!(saldo_total: @total)
    end
  end

  private

  def empenho_params
    params.require(:empenho).permit(:valor, :motorista, :status)
  end

  def set_motorista
    @motorista = User.find_by_email(params[:empenho][:motorista])
  end
end
