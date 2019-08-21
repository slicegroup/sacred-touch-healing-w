class UserMailer < ApplicationMailer
	
	def send_new_message(user)
			@message = user
			mail(from: "pruebajose98617@gmail.com", to: @message[:to_emails])
	end
	
	def send_new_message_admin(user)
		@message = user
		mail(to: "pruebajose98617@gmail.com")
	end 

end
