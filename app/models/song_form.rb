class SongForm
  include ActiveModel::Model

  attr_accessor :user_id,:name, :artist, :album, :text, :link,
                :id, :created_at, :updated_at, :playlist_id, :tag_id

  with_options presence: true do
    validates :name
    validates :artist
    validates :album
  end

  def save
    Song.create(user_id: user_id,name: name, artist: artist, album: album, text: text, link: link)
  end

  def update(params, song)
    song.update(params)
  end
end