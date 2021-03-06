class Review < ApplicationRecord
  belongs_to :consumer
	belongs_to :farmer, optional: true

	validates :rating, presence: true
	validates :comment, presence: true
end
