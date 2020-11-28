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
| encrypted_password  | string | null: false              |  
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_name_reading  | string | null: false              |
| last_name_reading   | string | null: false              |
| birth_date          | date   | null: false              |

### Association

- has_many :items
- has_many :records



## items テーブル

| Column          | Type   | Options                       |
| ----------------| ------ | ------------------------------|
| user_id         | integer| null: false,foreign_key: true |
| name 　　　      | string | null: false                   |
| text            | text   | null: false                   |
| category_id     | integer| null: false                   |
| condition_id    | integer| null: false                   |
| shipping_id     | integer| null: false                   |
| prefecture_id   | integer| null: false                  |
| day_to_ship_id  | integer| null: false                   |
| price           | integer| null: false                   |

### Association

belongs_to :user
has_one :record

## records テーブル

| Column          | Type    | Options                      |
| ----------------| ------  | ---------------------------- |
| user_id         | integer | null: false,foreign_key: true|
| item_id         | integer | null: false,foreign_key: true|



### Association
belongs_to :user
belongs_to :item
has_one :shipping_address 





## shipping_addresses テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| record_id       | integer| null: false,foreign_key: true  |
| postal_code     | string | null: false                    |
| prefecture_id   | integer| null: false                    |
| city            | string | null: false                    |
| house_number    | string | null: false                    |
| building_name   | string | 　　　　　　　　                  |
| phone_number    | string | null: false                    |

### Association

belongs_to :record