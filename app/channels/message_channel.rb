class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	# Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    stream_from 'messages'
  end

  def unsubscribed
  end

  def speak(data)
    current_user.messages.create!(text: data['message'])
    message = {user: current_user.name, message: data['message']}
    ActionCable.server.broadcast 'messages', message
  end
end
