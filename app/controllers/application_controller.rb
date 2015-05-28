class ApplicationController < ActionController::Base
    before_filter :configure_permitted_parameters, if: :devise_controller?
    helper_method :current_band

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up)
      devise_parameter_sanitizer.for(:account_update)
    end

    private

    def current_band
      @_current_band ||= session[:current_band_id] &&
        Band.find_by_id(session[:current_band_id])
    end
end
