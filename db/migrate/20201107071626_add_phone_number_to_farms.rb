class AddPhoneNumberToFarms < ActiveRecord::Migration[6.0]
  def change
    add_column :farms, :phone_number, :string
  end
end
