class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_condominium
  protect_from_forgery with: :exception
 

  def current_condominium
  	@current_condominium ||= Condominium.find(current_user.condominium_id)
  end


end
