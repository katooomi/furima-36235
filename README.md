# usersテーブル

| Column                  | Type       | Options     |
| ----------------------- | -----------| ----------- |
| user                    | string     | null: false |
| email                   | string     | null: false |
| encrypted_password      | string     | null: false |
| full_name_kanji         | string     | null: false |
| full_name_kana          | string     | null: false |
| birthday                | ActiveHash | null: false |

## Association
has_many :items
has_many :orders


# items テーブル

| Column                 | Type        | Options      |
| ---------------------- | ------------| -------------|
| image                  | string      | null: false  |
| title                  | string      | null: false  |
| text                   | text        | null: false  |
| category               | ActiveHash  | null: false  |
| price                  | string      | null: false  |
| user                   | references  | null: false  |

## Association
_belongs_to :user
_belongs_to :order


# ordersテーブル
| Column         | Type          | Options                           |
| -------------- | ----------    | --------------------------------- |
| user           | references    | null: false, foreign_key: true    |
| item           | references    | null: false, foreign_key: true    |
| credit_card    | PAY.JP        | null: false, foreign_key: true    |

## Association
_belongs_to :item
_belongs_to :address
has_many    :user




# addressテーブル
| Column              | Type           | Options                           |
| --------------------| -------------- | --------------------------------- |
| user_address        | references     | null: false, foreign_key: true    |
|                     |                |                                   |

## Association
_belongs_to :user
_belongs_to :item
_belongs_to :order