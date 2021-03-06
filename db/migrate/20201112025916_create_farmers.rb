class CreateFarmers < ActiveRecord::Migration[6.0]
  def change
    create_table :farmers do |t|
      t.string :farm_name
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
