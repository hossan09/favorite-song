class SongForm
  include ActiveModel::Model

  attr_accessor :user_id, :name, :artist, :album, :text, :link,
                :id, :created_at, :updated_at, :playlist_id, :tag_id,
                :tag_name, :playlist_name

  with_options presence: true do
    validates :name
    validates :artist
    validates :album
  end

  def save
    song = Song.create(user_id: user_id, name: name, artist: artist, album: album, text: text, link: link)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    SongTag.create(song_id: song.id, tag_id: tag.id)
  end

  def update(params, song)
    song.update(params)
  end
end