# usersテーブル

| Column                  | Type             | Options                   |
| ----------------------- | -----------------| --------------------------|
| name                    | string           | null: false               |
| email                   | string           | null: false, unique:true  |
| encrypted_password      | string           | null: false               |
| last_name_kanji         | string           | null: false               |
| first_name_kanji        | string           | null: false               |
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
| category_id            | to_s          | null: false  | 
| condition_id           | to_s          | null: false  |
| delivery_fee           | to_s          | null: false  |
| sending_area           | to_s          | null: false  |
| duration               | to_s          | null: false  |
| price                  | to_s          | null: false  |
| user_id                | references    | null: false  |

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
| prefecture          | to_s                | null: false                       |
| city                | string              | null: false                       |
| street              | string              | null: false                       |
| building            | string              |                                   |
| phone               | string              | null: false,                      |
| order_id            | references          | null: false, foreign_key: true    |


## Association
_belongs_to :order