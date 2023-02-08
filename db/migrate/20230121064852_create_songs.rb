class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :name,          null: false
      t.string :artist,        null: false
      t.string :album,         null: false
      t.text :text
      t.string :link
      t.references :user,      null: false, foreign_key: true
      t.references :playlist,  foreign_key: true
      t.references :tag,       foreign_key: true
      t.timestamps
    end
  end
end
