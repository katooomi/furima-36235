class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :text, presence: true
  validates :image, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture, presence: true
  validates :duration, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid" }
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :duration
  belongs_to :prefecture
  
  
  

end
