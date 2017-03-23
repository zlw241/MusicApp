class CreateTrackTable < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.text :lyrics
      t.integer :album_id
      t.integer :length
      t.boolean :bonus_track, default: false
      t.binary :audio
      
      t.timestamps
    end
  end
end
