class Message < ApplicationRecord
  belongs_to :condominium
  
  after_create_commit { ChatBroadcastJob.perform_later self }

  	def admin
  		Admin.find(self.admin_id)
  	end

  	def resident
  		Resident.find(self.resident_id)
  	end

  private
end