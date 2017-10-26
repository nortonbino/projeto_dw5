class Condominium < ApplicationRecord
	belongs_to :user
	has_many :fees

	validates :name, presence: true
	validates :number_proprieties, :length => { :minimum => 1 }
	validates :address, presence: true

end
