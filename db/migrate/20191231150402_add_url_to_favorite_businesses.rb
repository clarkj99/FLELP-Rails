class AddUrlToFavoriteBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_businesses, :image_url, :string
    add_column :favorite_businesses, :phone, :string
    add_column :favorite_businesses, :location, :string
  end
end
