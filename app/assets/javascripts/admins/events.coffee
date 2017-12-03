$(document).on 'turbolinks:load', ->
  MRCONDOMINIA.toggleMessage()

  MRCONDOMINIA.toggleMessage = ->
  return unless $('#condominia_show').length > 0

  