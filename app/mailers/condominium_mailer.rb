class CondominiumMailer < ApplicationMailer

	def send_fees_email(resident)
		#@condominium = condominium

		#@condominium.residents.each do |c|	
		#	mail(to: c.email, subject: 'Hello')
		#end

	    mail(to: resident.email, subject: 'Hello')
	end
end