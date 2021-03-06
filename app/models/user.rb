class User < ApplicationRecord
	has_many :farmers
	has_many :consumers
  enum state: [:active, :deactivated]

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address_line_1, presence: true
  # validates :city, presence: true
  # validates :parish, presence: true
  # validates :phone_number, length: { is: 7 }, numericality: { only_integer: true }

  accepts_nested_attributes_for :farmers

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, 
         :timeoutable, :timeout_in => 20.minutes

	mount_uploader :avatar, ImageUploader

 	def consumer?
 		account_type == "consumer"
 	end

 	def farmer?
 		account_type == "farmer"
 	end

end
