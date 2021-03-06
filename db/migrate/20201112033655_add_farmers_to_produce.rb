class AddFarmersToProduce < ActiveRecord::Migration[6.0]
  def change
    add_reference :produces, :farmers, foreign_key: true, index: true
  end
end
