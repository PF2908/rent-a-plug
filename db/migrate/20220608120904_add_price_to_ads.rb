class AddPriceToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :price, :float
  end
end
