class Produce < ApplicationRecord
  belongs_to :farmer

	mount_uploaders :images, ImageUploader

  validates :name, presence: true
  validates :description, presence: true

  def seller
  	Farmer.find_by_id(farmer_id)
  end

  def available_to_string
    available? ? "Yes" : "No"  
  end

  def available_badge_class
    available? ? "badge-success" : "badge-danger"  
  end

end
