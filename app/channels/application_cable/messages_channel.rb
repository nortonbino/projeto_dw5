class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	# Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    puts "subscribed"
    stream_from "condominium:#{params['condominium_id']}:messages"
  end

  def unsubscribed
  end

  def speak(data)
    current_admin.messages.create!(text: data['message'])
    message = {user: current_admin.name, message: data['message']}
    ActionCable.server.broadcast 'messages', message
  end
end
