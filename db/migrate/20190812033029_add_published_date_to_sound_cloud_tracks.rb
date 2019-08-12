class AddPublishedDateToSoundCloudTracks < ActiveRecord::Migration[5.1]
  def change
    add_column :soundcloud_tracks, :published_date, :date
  end
end
