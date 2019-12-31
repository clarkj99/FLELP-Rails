class AddNameToFavoriteBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_column :favorite_businesses, :name, :string
  end
end
