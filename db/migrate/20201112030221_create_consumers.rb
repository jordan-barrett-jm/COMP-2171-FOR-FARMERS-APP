class CreateConsumers < ActiveRecord::Migration[6.0]
  def change
    create_table :consumers do |t|
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
