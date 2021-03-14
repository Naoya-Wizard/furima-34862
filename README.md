ER図：https://gyazo.com/1baf5ac3c3af0172775bbe9e79553540

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| last-name   | string | null: false |
| first-name  | string | null: false |
| birth-year  | string | null: false |
| birth-month | text   | null: false |
| birth-day   | text   | null: false |

### Association

- has_many :products
- has_many :records



## products テーブル

| Column         | Type      | Options           |
| -------------- | --------- | ----------------- |
| name           | string    | null: false       |
| description    | text      | null: false       |
| category       | string    | null: false       |
| status         | string    | null: false       |
| delivery-fee   | string    | null: false       |
| delivery-area  | string    | null: false       |
| delivery-days  | string    | null: false       |
| price          | integer   | null: false       |
| user           | reference | foreign_key: true |

### Association

- belongs_to :user
- has_one :record



## addresses テーブル

| Column       | Type      | Options           |
| ------------ | --------- | ----------------- |
| postcode     | string    | null: false       |
| prefecture   | text      | null: false       |
| municipality | string    | null: false       |
| address      | string    | null: false       |
| buildingname | string    | null: false       |
| phonenumber  | string    | null: false       |
| product      | reference | foreign_key: true |
| record       | reference | foreign_key: true |

### Association

- belongs_to :record



## records テーブル

| Column   | Type        | Options           |
| -------- | ----------- | ----------------- |
| user     | reference   | foreign_key: true |
| product  | reference   | foreign_key: true |
| address  | reference   | foreign_key: true |

### Association

- belongs_to :user
- has-one :address
- belongs_to :product