class ChangeAlbumTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :albums, :band_id
    add_column :albums, :band_id, :integer
    add_index :albums, [:title, :band_id], unique: true
  end
end
