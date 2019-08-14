class SoundCloudTrack < ApplicationRecord
  self.table_name = 'soundcloud_tracks'

  DIR_PATH  = 'public/podcasts'
  URL_PATH  = 'podcasts'

  validates :track_id,              presence: false, uniqueness: true
  validates :title,                 presence: false
  validates :original_content_size, presence: false
  validates :duration,              presence: false
  validates :download_url,          presence: false
  validates :permalink,             presence: false
  validates :permalink_url,         presence: false
  validates :uploaded_at,           presence: false

  # instance methods
  def path
    "#{DIR_PATH}/#{id}.md"
  end

  def url
    "/#{URL_PATH}/#{id}"
  end

  def exists?(offset: 0)
    return false if path.include?("\u0000")
    File.exists?("#{DIR_PATH}/#{id + offset}.md")
  end

  def content
    exists? ? File.read(path) : ''
  end
end
