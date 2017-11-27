class Admins::MessagesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_condominium

  def index
  	@messages = @condominium.messages
  end

  def create
  	@message = @condominium.messages.build(message_params)
  	@message.admin_id = current_admin.id
  	if @message.save
        redirect_to admins_condominium_messages_path(@condominium)
      else
        render :new
    end
  end

  private
    def set_condominium
     @condominium = Condominium.find(params[:condominium_id])
    end


      def message_params
      params.require(:message).permit(:text, :admin_id, :condominium_id)
    end
end