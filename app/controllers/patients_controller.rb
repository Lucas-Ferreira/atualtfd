class PatientsController < ApplicationController
  def create
    #raise
    @travel = Travel.find(params[:travel_id])
    @patient = Patient.new(patient_params)
    @state = ''
    respond_to do |format|
      if @patient.save!
        #binding.pry
        @confirmation = Confirmation.new
        @confirmation.patient = @patient
        @confirmation.travel = @travel
        @confirmation.save!
        @state = true
        format.html { redirect_to travel_path(@travel), notice: "Criado com sucesso" }
        format.js { render 'applicants/new' }
        #redirect_to travel_path(@travel) ,notice: "Criado com sucesso"
      else
        flash[:error] = 'Houve um erro ao aplicar para a vaga. Tente novamente.'
        format.js { render partial: 'applicants/fail' }
        @state = false
      end
    end
  end

  def destroy
    @travel = Travel.find(params[:travel_id])
    @patient = Patient.find(params[:id])
    if @patient.destroy
      redirect_to travel_path(@travel)
    else
      render :show
    end

  end

  private

  def patient_params
    params.require(:patient).permit(:name, :cel, :cpf, :city, :acompanhante, :destino, :travel_id, :endereco)
  end

#  def set_patient
#    @patient = Patient.find(params[:id])
#    raise
#  end
end
