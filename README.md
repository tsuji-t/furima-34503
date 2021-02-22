# README

# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | text    | null: false |
| email                | string  | null: false | 
| password             | string  | null: false |
| last_name_full       | string  | null: false |
| first_name_full      | string  | null: false |
| last_name_kana       | string  | null: false |
| first_name_kana      | string  | null: false |
| birthday             | date    | null: false |


### Association

- has_many :items
- has_one_attached :history



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| explanation     | text       | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| area_id         | integer    | null: false                    |
| delivery_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one_attached :image
- has_one_attached :history



## orders テーブル

| Column               | Type       | Options                           |
| -------------------- | ---------- | --------------------------------- |
| postal_code          | string     | null: false                       |
| state                | string     | null: false                       |
| city                 | string     | null: false                       |
| address_Line         | string     | null: false                       |
| building_name        | string     | null: false                       |
| phone_number         | string     | null: false                       |


### Association

- has_one_attached :history



## histories テーブル

| Column  | Type       | Options                           |
| ------- | ---------- | --------------------------------- |
| user    | references | null: false, foreign_key: true    |
| item    | references | null: false, foreign_key: true    |
| order   | references | null: false, foreign_key: true    |


- has_one_attached :user
- has_one_attached :item
- has_one_attached :order
