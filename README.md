# README

# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true | 
| encrypted_password   | string  | null: false               |
| last_name_full       | string  | null: false               |
| first_name_full      | string  | null: false               |
| last_name_kana       | string  | null: false               |
| first_name_kana      | string  | null: false               |
| birthday             | date    | null: false               |


### Association

- has_many :items
- has_many :histories



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| state_id        | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one_attached :image
- has_one :history



## orders テーブル

| Column               | Type       | Options                           |
| -------------------- | ---------- | --------------------------------- |
| postal_code          | string     | null: false                       |
| state_id             | integer    | null: false                       |
| city                 | string     | null: false                       |
| address_Line         | string     | null: false                       |
| building_name        | string     |                                   |
| phone_number         | string     | null: false                       |
| history              | references | null: false, foreign_key: true    |


### Association

- belongs_to :history



## histories テーブル

| Column  | Type       | Options                           |
| ------- | ---------- | --------------------------------- |
| user    | references | null: false, foreign_key: true    |
| item    | references | null: false, foreign_key: true    |



- belongs_to :user
- belongs_to :item 
- has_one :order
