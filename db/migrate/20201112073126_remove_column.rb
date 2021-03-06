class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :email_confirmed
  end
end
