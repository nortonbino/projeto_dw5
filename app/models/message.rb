class Message < ApplicationRecord
	belongs_to :condominium

	after_create_commit { ChatBroadcastJob.perform_later self }

	def user
		if admin_id.nil?
			user ||= Resident.find(resident_id)
		else
			user ||= Admin.find(admin_id)
		end
		user
	end
end