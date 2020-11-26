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

| Column          | Type   | Options                  |
| ----------------| ------ | ------------------------ |
| nickname        | string | null: false              |
| email           | string | null: false,unique: true |
| password        | string | null: false              |
| first-name      | string | null: false              |
| last-name       | string | null: false              |
| first-name(カナ) | string | null: false              |
| last-name(カナ)  | string | null: false              |
| birth-date      | integer| null: false              |

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
| category        | string | null: false                   |
| condition       | string | null: false                   |
| shipping        | integer| null: false                   |
| day to ship     | integer| null: false                   |
| price           | integer| null: false                   |

### Association

belongs_to :users
has_one :records


## records テーブル

| Column          | Type    | Options                      |
| ----------------| ------  | ---------------------------- |
| user_id         | integer | null: false,foreign_key: true|
| item_id         | integer | null: false,foreign_key: true|
| purchase_daytime| datetime| null: false                  |


### Association

belongs_to :items
has_one :shipping_address


## shipping_address テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| record_id       | integer| null: false,foreign_key: true  |
| postal_code     | integer| null: false                    |
| prefectures     | string | null: false                    |
| municipalities  | string | null: false                    |
| address         | string | null: false                    |
| building_name   | string | 　　　　　　　　                 |
| phone_number    | integer| null: false                    |

### Association

belongs_to :records