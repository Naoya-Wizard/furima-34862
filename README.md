ER図：https://gyazo.com/1baf5ac3c3af0172775bbe9e79553540

# テーブル設計

## users テーブル

| Column         | Type   | Options                   |
| -------------- | ------ | ------------------------- |
| nickname       | string | null: false               |
| email          | string | null: false, unique: true |
| last_name      | string | null: false               |
| last_name_ruby | string | null: false               |
| first_name     | string | null: false               |
| first_name_ruby| string | null: false               |
| birthday       | date   | null: false               |

### Association

- has_many :products
- has_many :records



## products テーブル

| Column            | Type      | Options           |
| ----------------- | --------- | ----------------- |
| name              | string    | null: false       |
| description       | text      | null: false       |
| category_id       | integer   | null: false       |
| status_id         | integer   | null: false       |
| delivery_fee_id   | integer   | null: false       |
| prefecture_id     | integer   | null: false       |
| delivery_day_id   | integer   | null: false       |
| price             | integer   | null: false       |
| user_id           | reference | foreign_key: true |

### Association

- belongs_to :user
- has_one :record



## addresses テーブル

| Column          | Type      | Options           |
| ------------    | --------- | ----------------- |
| postcode        | string    | null: false       |
| prefecture_id   | integer   | null: false       |
| municipality    | string    | null: false       |
| address         | string    | null: false       |
| buildingname    | string    |                   |
| phonenumber     | string    | null: false       |
| record          | reference | foreign_key: true |

### Association

- belongs_to :record



## records テーブル

| Column     | Type        | Options           |
| ---------- | ----------- | ----------------- |
| user_id    | reference   | foreign_key: true |
| product_id | reference   | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product