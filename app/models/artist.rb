# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime
#  updated_at :datetime
#  genre      :string
#

class Artist < ActiveRecord::Base

  GENRES = ["electronic", "pop", "hip-hop", "rock", "jazz", "classical", "country"]

  validates :name, presence: true


  has_many :albums,
    class_name: "Album",
    foreign_key: :artist_id,
    primary_key: :id

  has_many :tracks,
    through: :albums,
    source: :tracks


end
