class RegistrationsController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #respond_to :json

  def index
    @users = User.all
  end

  def new
    @users = User.all
  end

  def create
    @user = User.create(sign_up_params)
    @role = params[:role]
    #@user.account_id = ActsAsTenant.current_tenant.id
    if ActsAsTenant.current_tenant.nil?
      @user.account_id = "3"
    else
      @user.account_id = ActsAsTenant.current_tenant.id
    end
    @role === "Motorista" ? (@user.role = false) : (@user.role = true)
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "Usuário #{@user.email} Criado com sucesso" }
        format.js { redirect_to root_path }
        #render json: {
        #  messages: "Register In Successfully",
        #  is_success: true,
        #  data: {user: @user}
        #}
      else
        format.html { redirect_to root_path, notice: "Usuário #{@user.email} Não criado" }
        #render :status => 400,
              #:json => {:message => @user.errors.full_messages}
      end
    end
  end

  def create_admin_account
    @user = User.create(sign_up_params)
    @account = Account.find_by name: params[:account]
    @role = params[:role]
    @role === "Motorista" ? (@user.role = false) : (@user.role = true)
    #@user.account_id = @account.id
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: "Usuário #{@user.email} Criado com sucesso" }
        format.js { redirect_to root_path }
        #render json: {
        #  messages: "Register In Successfully",
        #  is_success: true,
        #  data: {user: @user}
        #}
      else
        format.html { redirect_to root_path, notice: "Usuário #{@user.email} Não criado" }
        #render :status => 400,
              #:json => {:message => @user.errors.full_messages}
      end
    end
  end

  def edit
  end

  def update
    if @user.update(sign_up_params)
      redirect_to users_path, notice: "Usuário #{@user.email} atualizado com sucesso"
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Usuário deletado com sucesso"
  end

  private

  def sign_up_params
    params.permit(:email, :username, :password, :role)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
