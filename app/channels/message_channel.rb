class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	# Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    puts "subscribed"
    stream_from "condominia:#{params['condominium_id']}:messages"
  end

  def unsubscribed
  end

  def speak(data)
    Message.create! text: data['message']
  end
end
