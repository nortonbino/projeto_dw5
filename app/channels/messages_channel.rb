class MessagesChannel < ApplicationCable::Channel
  def subscribed
  	# Streams provide the mechanism by which channels route published content (broadcasts) to their subscribers.
    puts "subscribed"
    stream_from "condominia:#{params['condominium_id']}:messages"
  end

  def unsubscribed
  end

  def speak(data)
    attributes = { text: data['message'], condominium_id: params['condominium_id']} 
    
    if current_user.is_a? Admin
      attributes[:admin_id] = current_user.id
    else
      attributes[:resident_id] = current_user.id
    end

    Message.create! attributes
  end
end