class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :year
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :categorie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
