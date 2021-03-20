class CreateExtensionOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :extension_officers do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
