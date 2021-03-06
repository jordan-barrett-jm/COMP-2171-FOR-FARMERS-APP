class Farmer < ApplicationRecord
  belongs_to :user
  has_many :produces
  has_many :reviews

  validates :farm_name, presence: true, uniqueness: true

  def has_consumer_review(id)
    reviews.where(consumer_id: id).present?
  end

  def review
  	reviews.present? ? "#{reviews.average(:rating).ceil} Stars" : "0 Stars"
  end
end
