class RenameColumn2 < ActiveRecord::Migration[6.0]
  def change
  	rename_column :farmers, :user_id, :users_id

  end
end
