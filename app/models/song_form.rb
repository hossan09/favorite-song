class SongForm
  include ActiveModel::Model

  attr_accessor :user_id,:name, :artist, :album, :text, :link

  with_options presence: true do
    validates :name
    validates :artist
    validates :album
  end

  def save
    Song.create(user_id: user_id,name: name, artist: artist, album: album, text: text, link: link)
  end
end