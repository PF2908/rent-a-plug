class CreateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :ads do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :number_of_plug
      t.string :location
      t.string :color
      t.integer :cable_length
      t.string :brand
      t.boolean :usb
      t.text :description

      t.timestamps
    end
  end
end
