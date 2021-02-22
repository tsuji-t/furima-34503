# README

# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | text    | null: false |
| email                | string  | null: false | 
| password             | string  | null: false |
| last_name_full       | text    | null: false |
| first_name_full      | text    | null: false |
| last_name_kana       | text    | null: false |
| first_name_kana      | text    | null: false |
| name_kana            | text    | null: false |
| birthday_year        | integer | null: false |
| birthday_month       | integer | null: false |
| birthday_day         | integer | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| image        | text       | null: false                    |
| title        | string     | null: false                    |
| category     | text       | null: false                    |
| status       | text       | null: false                    |
| delivery_fee | integer    | null: false                    |
| area         | string     | null: false                    |
| delivery_day | integer    | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one_attached :order
- has_one_attached :image




## orders テーブル

| Column               | Type       | Options                           |
| -------------------- | ---------- | --------------------------------- |
| credit_num           | text       | null: false                       |
| credit_expiration    | string     | null: false                       | 
| security_code        | string     | null: false                       |
| Postal_code          | text       | null: false                       |
| State                | text       | null: false                       |
| City                 | text       | null: false                       |
| address_Line         | text       | null: false                       |
| building_name        | text       | null: false                       |
| phone_number         | integer    | null: false                       |
| user                 | references | null: false, foreign_key: true |
| item                 | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one_attached :item
