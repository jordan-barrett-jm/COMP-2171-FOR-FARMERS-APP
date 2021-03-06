class Rename4 < ActiveRecord::Migration[6.0]
  def change
  	rename_column :produces, :farmers_id, :farmer_id
  end
end
