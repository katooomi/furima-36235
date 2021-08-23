require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
 describe 'オーダー先情報の保存' do
    before do
      item = FactoryBot.create(:item)
      sleep 0.5
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      sleep 0.5
      
    end

    context '内容に問題がない場合' do
      it "すべての値が正しく入力されていれば保存できること" do
      expect(@order_address).to be_valid
      end

      it "buildingは、空でも保存できること" do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
       
    end
    
    context '内容に問題がある場合' do

      it "user_idが空だと保存できないこと" do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
        end

      it "item_idが空だと保存できないこと" do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

      it "zip_codeが空だと保存できないこと" do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")
        end

      it "zip_codeが半角のハイフンを含んだ「3桁ハイフン4桁」の半角文字列でないと保存できないこと" do
        @order_address.zip_code = '1234-56789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it "prefecture_idを選択していないと保存できないこと" do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと保存できないこと" do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it "streetが空だと保存できないこと" do
        @order_address.street = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street can't be blank")
      end

      it "phoneが空だと保存できないこと" do
        @order_address.phone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone can't be blank")
      end

      it "phoneは9桁以下だと保存できないこと" do
        @order_address.phone = '090111122'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. 10 or 11 number")
      end

      it "phoneは12桁以上だと保存できないこと" do
        @order_address.phone = '0901111222233'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. 10 or 11 number")
      end

      it "phoneは半角数字のみでないと保存できないこと" do
        @order_address.phone = '09011aabb'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone is invalid. 10 or 11 number")
      end
       
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end 
end