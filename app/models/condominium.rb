class Condominium < ApplicationRecord
	belongs_to :user
	has_many :fees

	mount_uploader :avatar, AvatarUploader

	validates :name, presence: true
	validates :number_proprieties, :length => { :minimum => 1 }
	validates :address, presence: true

end
