class CondominiumMailer < ApplicationMailer
	def send_fees_email(resident)
	    mail(to: resident.email, subject: 'Hello')
	end
end