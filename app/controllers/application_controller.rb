class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_condominium
  protect_from_forgery with: :exception
 

  def current_condominium
  	@current_condominium ||= Condominium.find(current_admin.condominium_id)
  end

   def after_sign_in_path_for(resource)
     root_path
   end
 
   def after_sign_out_path_for(resource)
     new_admin_session_path
  end
end
