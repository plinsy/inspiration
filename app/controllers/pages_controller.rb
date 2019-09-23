class PagesController < ApplicationController
	before_action :authenticate_user, only: [:dashboard]

  def home
  end

  def about
  end

  def team
  end

  def contact
  end

  def dashboard
  end

  def profile
  end

  def edit_profile
  end

  protected
  def authenticate_user
  	authenticate_user!
  	unless current_user.role == "student" || current_user.admin
  		redirect_to connexion_path,
  		danger: "Bien essayer petit malin"
  	end
  end
end
