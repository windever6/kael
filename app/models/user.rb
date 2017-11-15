class User < ApplicationRecord
	def self.current
    Thread.current[:current_user]
  end

  def self.current=(user)
    Thread.current[:current_user] = user
    Thread.current[:current_user_name] = user.try(:name)
  end

  def self.current_name
  	Thread.current[:current_user_name]
  end

  def messages
  	Message.where("sender_id = ? or receiver_id = ?", id, id)
  end
end
