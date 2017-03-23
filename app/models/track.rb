# == Schema Information
#
# Table name: tracks
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  lyrics      :text
#  album_id    :integer
#  length      :integer
#  bonus_track :boolean          default("false")
#  audio       :binary
#  created_at  :datetime
#  updated_at  :datetime
#



class Track < ActiveRecord::Base

  validates :name, presence: true

  belongs_to :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id

end
