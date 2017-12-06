class Admins::MessagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_condominium

  def index
  	@messages = @condominium.messages
  end

  private
    def set_condominium
     @condominium = Condominium.find(params[:condominium_id])
    end
end