# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
MRCONDOMINIA.cable.message = ->
  obj = $('#condominium-show')
  return unless obj.length >0

  id = obj.data('condominium-id')

  App.messages = App.cable.subscriptions.create { channel: "MessageChannel", condominium_id: id},

    connected: ->
      console.log("connected")

    disconnected: ->
      console.log("disconnected")

    received: (data) ->
      $('#messages').append data['message']

    speak: (message) ->
      @perform 'speak', message: message

    renderMessage: (data) ->
      console.log data
      "<p> <b>" + data.user + ": </b>" + data.message + "</p>"


  $(document).on 'submit', '#new_message', (event) ->
    message = $('#message_text').val()
    $('#message_text').val("")
    App.messages.speak(message)
    event.preventDefault()