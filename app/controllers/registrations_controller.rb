class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:profile, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:city, :state, :zipcode, :email, :password, :password_confirmation, :current_password)
  end
end
