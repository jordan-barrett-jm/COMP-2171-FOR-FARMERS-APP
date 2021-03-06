class Farm < ApplicationRecord
  belongs_to :user
  has_many :produce

	mount_uploader :image, ImageUploader
	
	validates :name, presence: true, uniqueness: true
	validates :description, presence: true
	validates :address_line_1, presence: true
	validates :address_line_2, presence: true
end
