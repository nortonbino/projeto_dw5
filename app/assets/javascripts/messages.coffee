# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
App.messages = App.cable.subscriptions.create 'MessagesChannel',

  connected: ->
    console.log("connected")

  disconnected: ->
    console.log("disconnected")

  received: (data) ->
    $('#messages').append(@renderMessage(data))

  speak: (message) ->
    @perform 'speak', message: message

  renderMessage: (data) ->
    console.log data
    "<p> <b>" + data.user + ": </b>" + data.message + "</p>"


$(document).on 'turbolinks:load', ->
  if $('#messages-index').length
    $('#messages').animate
          scrollTop: $('#messages')[0].scrollHeight
    , 2000

$(document).on 'submit', '#new_message', (event) ->
  message = $('#message_text').val()
  $('#message_text').val("")
  App.messages.speak(message)
  event.preventDefault()
  setTimeout ->
    $('input:submit').attr("disabled", false)
  , 100
  $('#messages').animate
        scrollTop: $('#messages')[0].scrollHeight
  , 2000