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
    #一度タグの紐付けを消す
    song.song_tags.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    song.update(params)
    SongTag.create(song_id: song.id, tag_id: tag.id) if tag_name.present?
  end
end