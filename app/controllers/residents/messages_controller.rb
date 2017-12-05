class Residents::MessagesController < ApplicationController

  before_action :authenticate_resident!
  before_action :set_condominium

  def index
  	@messages = @condominium.messages
  end

  def create
  	@message = @condominium.messages.build(message_params)
  	@message.resident_id = current_resident.id
  	if @message.save
        redirect_to residents_root_path(@condominium)
      else
        render :new
    end
  end

  private
  
  def set_condominium
    @condominium = Condominium.find(params[:condominium_id])
  end

  def message_params
    params.require(:message).permit(:text, :resident_id, :condominium_id)
  end

end
