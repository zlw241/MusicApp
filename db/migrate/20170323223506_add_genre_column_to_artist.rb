class AddGenreColumnToArtist < ActiveRecord::Migration
  def change

    add_column :artists, :genre, :string
  end
end
