class RegistrationsController < Devise::RegistrationsController

  protected
    def after_sign_up_path_for(user)
      new_profile_path
    end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password)
  end

  def account_update_params
    params.require(:user).permit(:role, :email, :password, :password_confirmation, :current_password)
  end
end
