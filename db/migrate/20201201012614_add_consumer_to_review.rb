class AddConsumerToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :consumer, foreign_key: true, index: true
  end
end
