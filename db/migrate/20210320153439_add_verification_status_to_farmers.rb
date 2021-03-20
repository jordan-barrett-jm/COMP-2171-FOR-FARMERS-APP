class AddVerificationStatusToFarmers < ActiveRecord::Migration[6.0]
  def change
    add_column :farmers, :verification_status, :boolean
  end
end
