class AddColumnToFavoriteBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_businesses, :latitude, :float
    add_column :favorite_businesses, :longitude, :float
  end
end
