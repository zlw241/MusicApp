class AddAudioAttachment < ActiveRecord::Migration
  def change

    add_attachment :tracks, :audio
  end
end
