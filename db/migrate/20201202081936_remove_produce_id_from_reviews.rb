class RemoveProduceIdFromReviews < ActiveRecord::Migration[6.0]
  def change
  	remove_column :reviews, :produce_id
  end
end
