# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  MRCONDOMINIA.loadChat()


MRCONDOMINIA.loadChat = -> 
  obj = $('#condominium-chat')
  return unless obj.length > 0
 
  $('#new_message').on 'submit', (event) ->
    message = $('#message_text').val()
    console.log message
    $('#message_text').val("")
    App.messages.speak(message)
    false