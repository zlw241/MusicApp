# == Schema Information
#
# Table name: tracks
#
#  id                 :integer          not null, primary key
#  name               :string           not null
#  lyrics             :text
#  album_id           :integer
#  length             :integer
#  bonus_track        :boolean          default("false")
#  audio              :binary
#  created_at         :datetime
#  updated_at         :datetime
#  audio_file_name    :string
#  audio_content_type :string
#  audio_file_size    :integer
#  audio_updated_at   :datetime
#

class Track < ActiveRecord::Base
  #attr_accessor :audio_file_name

  validates :name, presence: true

  has_attached_file :audio

  validates :audio,
  :attachment_content_type => { :content_type => [
      'audio/mpeg',
      'audio/x-mpeg',
      'audio/mp3',
      'audio/x-mp3',
      'audio/mpeg3',
      'audio/x-mpeg3',
      'audio/mpg',
      'audio/x-mpg',
      'audio/x-mpegaudio'
  ]}

  belongs_to :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id

end
