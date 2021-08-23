class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street,:building, :phone, :user_id, :item_id, :token
  validates :token, presence: true


  validates :zip_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}
  
  with_options presence: true do
    validates :city
    validates :street
    validates :user_id
    validates :item_id
  end  
  
  validates :phone, presence: true, format: {with: /\A\d{10,11}\z/, message: "is invalid. 10 or 11 number"}
   


  def save
   order = Order.create(user_id: user_id, item_id: item_id)
   Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, order_id: order.id)
  end


end