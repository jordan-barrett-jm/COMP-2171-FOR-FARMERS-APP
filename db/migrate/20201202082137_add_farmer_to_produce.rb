class AddFarmerToProduce < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :farmer, index: true, foreign_key: true
  end
end
