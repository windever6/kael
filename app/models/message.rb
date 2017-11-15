class Message < ApplicationRecord
	after_commit { MessageSendJob.perform_later(self, self.send_by_current_user?) }
	
	def send_by_current_user?
		sender == User.current_name
	end

	def receive_by_current_user?
		receiver == User.current_name
	end
end
