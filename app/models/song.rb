class Song < ApplicationRecord
  belongs_to :user
  has_many :song_tags
  has_many :tags, through: :song_tags
  has_many :song_playlists
  has_many :playlists through: :song_playlists

  with_options presence: true do
    validates :name
    validates :artist
    validates :album
  end

end
