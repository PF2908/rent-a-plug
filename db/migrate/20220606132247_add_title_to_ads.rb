class AddTitleToAds < ActiveRecord::Migration[6.1]
  def change
    add_column :ads, :title, :string
  end
end
