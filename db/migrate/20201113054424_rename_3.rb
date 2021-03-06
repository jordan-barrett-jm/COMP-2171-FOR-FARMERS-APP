class Rename3 < ActiveRecord::Migration[6.0]
  def change
  	rename_column :farmers, :users_id, :user_id
  	rename_column :consumers, :users_id, :user_id
  end
end
