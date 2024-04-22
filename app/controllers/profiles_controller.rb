class ProfilesController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(profile_params)
      redirect_to root_path, notice: "Perfil atualizado com sucesso"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email, :password)
  end

end