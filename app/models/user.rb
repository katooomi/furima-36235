class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 with_options presence: true do
  validates :email
  validates :password 
  validates :nickname 
  validates :last_name 
  validates :first_name
  validates :last_name_kana
  validates :first_name_kana
  validates :birth

  with_options format: { with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: '半角英数字混同にしてください' } do
    validates :password
   end
  
   with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
   end
  
   with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角文字を使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
   end
 end
end
