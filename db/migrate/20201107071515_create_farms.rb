class CreateFarms < ActiveRecord::Migration[6.0]
  def change
    create_table :farms do |t|
      t.string :name
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :parish
      t.text :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
