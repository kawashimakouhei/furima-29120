# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column              | Type   | Options                  |
| --------------------| ------ | ------------------------ |
| nickname            | string | null: false              |
| email               | string | null: false,unique: true |
| encrypted_password  | string | null: false            |  
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_name_kana     | string | null: false              |
| last_name_kana      | string | null: false              |
| birth_date          | date   | null: false              |

### Association

- has_many :items
- has_many :records



## items テーブル

| Column          | Type   | Options                       |
| ----------------| ------ | ------------------------------|
| user_id         | integer| null: false,foreign_key: true |
| record_id       | integer| null: false,foreign_key: true |
| image_url       | string | null: false                   |
| text            | text   | null: false                   |
| category_id     | string | null: false                   |
| condition_id    | string | null: false                   |
| shipping_id     | integer| null: false                   |
| day to ship_id  | integer| null: false                   |
| price           | integer| null: false                   |

### Association

belongs_to :users
has_one :records





## shipping_address テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| record_id       | integer| null: false,foreign_key: true  |
| postal_code     | string| null: false                    |
| prefectures     | string | null: false                    |
| municipalities  | string | null: false                    |
| address         | string | null: false                    |
| building_name   | string | 　　　　　　　　                 |
| phone_number    | string | null: false                    |

### Association

