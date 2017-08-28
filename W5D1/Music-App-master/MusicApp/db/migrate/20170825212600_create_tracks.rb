class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.string :title, null: false
      t.string :ord, null: false
      t.text :lyrics
      t.boolean :bonus, null: false, default: false
      t.timestamps
    end
    add_index :tracks, :album_id
    add_index :tracks, [:title, :album_id], unique: true
  end
end
