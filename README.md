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
| birth_day        | date       | null: false                    |

### Association

- has many :items
- has many :items_buyers

## items テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| itroduction     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| postage         | integer    | null: false                    |
| prefecture      | integer    | null: false                    |
| preparation_day | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has one :items_buyers
- has one :buyers
- belongs_to :user

## buyers テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_cpde     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | strind     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- has many :items_buyers
- belongs_to :items_buyers

## items_buyers テーブル

| Colum           | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- has one :buyers
- belongs_to :user
- belongs_to :item

