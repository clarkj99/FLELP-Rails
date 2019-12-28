class CreateFavoriteBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_businesses do |t|
      t.references :user
      t.string :business_id

      t.timestamps
    end
  end
end
