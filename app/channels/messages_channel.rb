class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	# Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    puts "subscribed"
    stream_from "condominia:#{params['condominium_id']}:messages"
  end

  def unsubscribed
  end

  def speak(data)
    Message.create! resident_id: current_user.id, text: data['message'], condominium_id: params['condominium_id']
  end
end