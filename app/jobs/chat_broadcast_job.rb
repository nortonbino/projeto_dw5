class ChatBroadcastJob < ApplicationJob
  queue_as :default
 
  def perform(message)
    ActionCable.server.broadcast "condominia:#{message.condominium_id}:messages",
    							 message: { user: message.user.name, text: message.text }
  end
 
  #private
  #def render_message(message)
  #  ApplicationController.renderer.render(partial: 'shared/messages/message', locals: { message: message })
  #end
end
