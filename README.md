# usersテーブル

| Column                  | Type             | Options                   |
| ----------------------- | -----------------| --------------------------|
| nickname                | string           | null: false               |
| email                   | string           | null: false, unique:true  |
| encrypted_password      | string           | null: false               |
| last_name               | string           | null: false               |
| first_name              | string           | null: false               |
| last_name_kana          | string           | null: false               |
| first_name_kana         | string           | null: false               |   
| birthday                | date             | null: false               |

## Association
has_many :items
has_many :orders


# items テーブル

| Column                 | Type          | Options      |
| ---------------------- | --------------| -------------|
| title                  | string        | null: false  |
| text                   | text          | null: false  |
| category_id            | integer       | null: false  | 
| condition_id           | integer       | null: false  |
| delivery_fee_id        | integer       | null: false  |
| prefecture_id          | integer       | null: false  |
| duration_id            | integer       | null: false  |
| price                  | integer       | null: false  |
| user                   | references    | null: false  |

## Association
_belongs_to :user
has_one :order



# ordersテーブル
| Column         | Type          | Options                           |
| -------------- | ----------    | --------------------------------- |
| user           | references    | null: false, foreign_key: true    |
| item           | references    | null: false, foreign_key: true    |


## Association
_belongs_to :user
_belongs_to :item
has_one :address



# addressesテーブル
| Column              | Type                | Options                           |
| --------------------| ------------------- | --------------------------------- |
| zip_code            | string              | null: false                       |
| prefecture_id       | integer             | null: false                       |
| city                | string              | null: false                       |
| street              | string              | null: false                       |
| building            | string              |                                   |
| phone               | string              | null: false,                      |
| order               | references          | null: false, foreign_key: true    |


## Association
_belongs_to :order