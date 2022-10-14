class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def edit
  end

  def update
  end

  def show
    sign_out :user
    redirect_to new_user_session_path
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
