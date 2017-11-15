class MessageSendJob < ApplicationJob
  queue_as :default

  def perform(message, send_flag)
  	send_message = ChatsController.render(partial: 'chats/message', locals: { msg: message, send_flag: send_flag })
  	receive_message = ChatsController.render(partial: 'chats/message', locals: { msg: message, send_flag: !send_flag })
    ActionCable.server.broadcast("chatroom_channel", { send_message: send_message, receive_message: receive_message, sender: message.sender})
  end

end
