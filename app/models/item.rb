class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  
  has_one_attached :image
  with_options presence: true do
   validates :title
   validates :text
   validates :image
  end

   
  
  
  

  with_options presence:true,numericality: { other_than: 1, message: "can't be blank" } do
   validates :category_id
   validates :condition_id
   validates :delivery_fee_id
   validates :duration_id
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :duration
  belongs_to :prefecture
  
  
  

end
