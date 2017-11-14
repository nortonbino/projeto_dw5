class Resident < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :condominium
  has_many :messages

  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  validates :password, :length => { :minimum => 6 }

end
