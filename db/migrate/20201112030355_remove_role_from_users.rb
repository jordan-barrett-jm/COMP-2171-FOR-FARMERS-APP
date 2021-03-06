class RemoveRoleFromUsers < ActiveRecord::Migration[6.0]
  def change
 		remove_column :users, :role
 		add_column :users, :admin, :boolean, default: false
 		add_column :users, :address_line_1, :string
 		add_column :users, :address_line_2, :string
 		add_column :users, :city, :string
 		add_column :users, :parish, :string
 		add_column :users, :phone_number, :string
 		add_column :users, :state, :integer, default: 0
  
  end
end
