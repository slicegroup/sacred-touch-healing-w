class UserMailer < ApplicationMailer
	def send_new_message(user)
		@message = user
		mail(from:'jonorebra@gmail.com', to: @message[:to_emails], subject: @message[:subject])
	end
	
	def send_new_message_admin(user)
		@message = user
		mail(from:'jonorebra@gmail.com', to:'jonorebra@gmail.com', subject: @message[:subject])
	end 
end
