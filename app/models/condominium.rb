class Condominium < ApplicationRecord
	belongs_to :user
	has_many :fees
end
