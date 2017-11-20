class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_condominium

  def current_condominium
  	@current_condominium ||= Condominium.find(current_admin.condominium_id)
  end

   def after_sign_in_path_for(resource)
     root_path
   end
 
   def after_sign_out_path_for(resource)
     new_admin_session_path
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
