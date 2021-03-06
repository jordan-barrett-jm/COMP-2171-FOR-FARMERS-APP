class CreateProduces < ActiveRecord::Migration[6.0]
  def change
    create_table :produces do |t|
      t.string :name
      t.text :description
      t.json :images
      t.boolean :available, default: true
      t.references :farm, null: false, foreign_key: true

      t.timestamps
    end
  end
end
