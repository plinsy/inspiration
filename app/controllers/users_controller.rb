class UsersController < ApplicationController
  before_action :authenticate_user

  def index
  end

  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def update
    if current_user.update(user_params)
      respond_to do |format|
        format.html { redirect_to mon_profil_path, success: "Parfait!" }
      end
    else
      respond_to do |format|
        format.html { redirect_to editer_mon_profil_path, danger: current_user.errors.full_messages }
      end
    end
  end

  def destroy
  end

  protected
  def authenticate_user
    authenticate_user!
  end
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :birthdate)
  end
end
