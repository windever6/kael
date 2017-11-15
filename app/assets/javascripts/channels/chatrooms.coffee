App.service = App.cable.subscriptions.create "ChatroomsChannel",
  data_messages: -> $("[data-channel='messages']")
  data_message_area: -> $("[data-area='message']")

  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    message = if @data_messages().attr("user-name") is data.sender then data.send_message else data.receive_message
    @data_messages().append(message)
    @data_message_area().val('')

