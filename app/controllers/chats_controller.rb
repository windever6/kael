class ChatsController < ApplicationController
  def index
  	@messages = @current_user.messages.order(:created_at)
  end
end
