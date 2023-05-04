class Altar < ActiveRecord::Migration[7.0]
  def change
    change_column :artworks, :image_url, :string, unique: true
    change_column :artworks, :artist_id, :bigint, unique: false

  end
end
