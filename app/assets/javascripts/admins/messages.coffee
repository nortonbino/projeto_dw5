$(document).on 'turbolinks:load', ->
  MRCONDOMINIA.loadChat()


MRCONDOMINIA.loadChat = -> 
  obj = $('#condominium-chat-admins')
  return unless obj.length > 0
 
  $('#new_message').on 'submit', (event) ->
    message = $('#message_text').val()
    console.log message
    $('#message_text').val("")
    App.messages.speak(message)
    false