class Condominium < ApplicationRecord
	belongs_to :admin
	has_and_belongs_to_many :residents
	has_many :fees
	has_many :messages


	mount_uploader :avatar, AvatarUploader

	validates :name, presence: true
	validates :number_proprieties, :length => { :minimum => 1 }
	validates :address, presence: true


end
