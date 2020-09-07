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

# テーブル設計

## users テーブル

| Colum            | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false                    |
| password         | string     | null: false                    |
| first_name       | string     | null: false                    |
| family_name      | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| family_name_kana | string     | null: false                    |
| birth_year       | string     | null: false                    |
| birth_month      | string     | null: false                    |
| birth_day        | string     | null: false                    |

### Association

- has many :items
- has many :buyers
- has many :item_imgs

## items テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_img        | references | null: false, foreign_key: true |
| name            | string     | null: false                    |
| itroduction     | text       | null: false                    |
| category        | references | null: false, foreign_key: true |
| status          | references | null: false, foreign_key: true |
| postage         | references | null: false, foreign_key: true |
| prefecture      | references | null: false, foreign_key: true |
| preparation_day | references | null: false, foreign_key: true |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has many :items_buyers
- has many :buyers, through: items_buyers
- has one :buyers
- has one :items_imgs
- belongs_to :users

## buyers テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_cpde     | integer    | null: false                    |
| prefecture      | references | null: false, foreign_key: true |
| city            | string     | null: false                    |
| house_number    | integer    | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- has many :items_buyers
- has many :buyers, through: items_buyers
- has one :items_imgs
- belongs_to :items
- belongs_to :users

## items_buyers テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item            | references | null: false, foreign_key: true |
| buyer           | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :buyers

## items_imgs テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| url             | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |
| buyer           | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :buyers