# テーブル設計

## usersテーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| encrypted_password  | string  | null: false               |
| email               | string  | null: false, unique: true |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_kana      | string  | null: false               |
| first_name_kana     | string  | null: false               |
| birth               | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| name              | string    | null: false                    |
| text              | text      | null: false                    |
| category_id       | integer   | null: false                    |
| status_id         | integer   | null: false                    |<!--商品状態-->
| delivery_fee_id   | integer   | null: false                    |<!--配送料-->
| prefecture_id     | integer   | null: false                    |
| price             | integer   | null: false                    |
| shipment_id       | integer   | null: false                    |<!--配送日数-->
| user              | reference | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## Ordersテーブル

| Column      | Type      | Options                        |
| ----------- | --------- | ------------------------------ |
| user        | reference | null: false, foreign_key: true |
| item        | reference | null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :item
- belongs_to :user

## Purchasesテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false                    |<!--郵便番号-->
| city               | string    | null: false                    |
| add_line1          | string    | null: false                    |<!--番地-->
| add_line2          | string    |                                |<!--建物名-->
| phone              | string    | null: false                    |
| prefecture_id      | integer   | null: false                    |
| order              | reference | null: false, foreign_key: true |

### Association

- belongs_to :order
