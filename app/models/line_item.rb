class LineItem < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :order, optional: true
  
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
