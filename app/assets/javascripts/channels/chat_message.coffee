App.chat_message = App.cable.subscriptions.create "ChatMessageChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

received: (data) ->
    $('#messages').append '<li>' + data['message'] + '</li>'
    # Called when there's incoming data on the websocket for this channel
  $(document).on 'keypress', '[data-behavior~=chat_input]', (event) ->
  if event.keyCode is 13 # return = send
    App.chat.speak event.target.value
    event.target.value = ''
    event.preventDefault()
