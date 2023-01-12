# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |

- has_many :songs
-has_many :orders

## songs テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| song_name | string     | null: false                    |
| artist    | string     | null: false                    |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| tag       | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :tags, through: :song_tags
-has_many :orders

## song_tags テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| songs_id | references | null: false, foreign_key: true |
| tags_id  | references | null: false, foreign_key: true |

- belongs_to :song
- belongs_to :tag

## tags テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| tag_name | string | null: false |

- has_many :song_tags
- has_many :songs through: :song_tags

## playlists テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| song      | references | null: false, foreign_key: true |

-belongs_to :user
-belongs_to :item