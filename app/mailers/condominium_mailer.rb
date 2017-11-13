class CondominiumMailer < ApplicationMailer


	def send_fees_email
		@condominium = condominium

		@condominium.residents.each do |c|	
			mail(to: c.email, subject: 'Hello')
		end
	end

end
