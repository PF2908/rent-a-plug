class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :ad, null: false, foreign_key: true
      t.integer :rate
      t.text :comment

      t.timestamps
    end
  end
end
