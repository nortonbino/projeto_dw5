class Fee < ApplicationRecord
	belongs_to :condominium

	validates :name, presence: true
	validates :installment, :length => { :minimum => 1 }
	validates :value, :length => { :minimum => 1 }
	validates :description, presence: true

end
