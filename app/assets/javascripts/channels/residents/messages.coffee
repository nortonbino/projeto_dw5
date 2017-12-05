MRCONDOMINIA.cable.message = ->
  obj = $('#condominium-chat-residents')
  return unless obj.length > 0

  id = obj.data('condominium-id')
  
  App.messages = App.cable.subscriptions.create { channel: "MessagesChannel", condominium_id: id},

    connected: ->
      console.log("connected")

    disconnected: ->
      console.log("disconnected")

    received: (data) ->
      @renderMessage(data)

    speak: (message) ->
      @perform 'speak', message: message

    renderMessage: (data) ->
      message = data.message
      msg = "<div class='container'><p><b>" + message.user + ": </b>" + message.text + "</p></div>"
      $('#messages').append msg