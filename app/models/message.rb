class Message < ApplicationRecord
  belongs_to :condominium

  	def admin
  		@admin = Admin.find(self.admin_id)
  	end
  private
end
