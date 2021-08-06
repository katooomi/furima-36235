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
| category               | ActiveHash    | null: false  |
| price                  | string        | null: false  |
| name                   | references    | null: false  |

## Association
_belongs_to :user
has_one :order
belongs_to :item



# ordersテーブル
| Column         | Type          | Options                           |
| -------------- | ----------    | --------------------------------- |
| user           | references    | null: false, foreign_key: true    |
| item           | references    | null: false, foreign_key: true    |


## Association
_belongs_to :user
_belongs_to :item
_belongs_to :order
has_one :address



# addressテーブル
| Column              | Type                | Options                           |
| --------------------| ------------------- | --------------------------------- |
| zip_code            | string              | null: false, foreign_key: true    |                               |
| prefecture          | ActiveHash          |                                   |
| city                | string              | null: false, foreign_key: true    |
| street              | string              | null: false, foreign_key: true    |
| building            | string              | null: false, foreign_key: true    |
| phone               | string              | null: false, foreign_key: true    |
| order_id            | references          | null: false, foreign_key: true    |


## Association
_belongs_to :user
_belongs_to :item
_belongs_to :order