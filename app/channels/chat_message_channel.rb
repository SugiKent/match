class ChatMessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
    ActionCable.server.broadcast 'chat_channel', message: 'connected.'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  ActionCable.server.broadcast 'chat_channel', message: data['message']
end
end
