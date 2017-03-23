# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  artist_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Album < ActiveRecord::Base

  validates :title, :artist_id, presence: true


  belongs_to :artist,
    class_name: "Artist",
    foreign_key: :artist_id,
    primary_key: :id

  has_many :tracks,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id


end
