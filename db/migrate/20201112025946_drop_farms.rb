class DropFarms < ActiveRecord::Migration[6.0]
  def change
 		remove_column :produces, :farm_id
 		drop_table :farms
  end
end
