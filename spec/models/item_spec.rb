require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

 

  describe '出品する'  do
    context 'ユーザーが出品できる時' do
      it '商品画像、商品名、商品の説明、カテゴリーと商品の状態、配送料の負担と発送元の地域発送までの日数、販売価格を入力すれば出品できること' do
      expect(@item).to be_valid
      end
    end

    context 'ユーザーが出品できない時' do
      it '商品画像がなしでは出品できない'do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では出品できない'do
       @item.title = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it '商品の説明が空では出品できない'do
       @item.text = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Text can't be blank"
      end

      it 'カテゴリーの情報が空では出品できない' do
       @item.category_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it 'カテゴリーは、「メンズ、レディース、ベビー・キッズ、インテリア・住まい・小物、本・音楽・ゲーム、おもちゃ・ホビー・グッズ、家電・スマホ・カメラ、スポーツ・レジャー、ハンドメイド、その他」の11項目から選択しないと出品できない'do
       @item.category_id = '---'
       @item.valid?
       expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態の情報が空では出品できない' do
       @item.condition_id = ''
       @item.valid?
       expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
       
      # it '商品の状態は、「---、新品・未使用、未使用に近い、目立った傷や汚れなし、やや傷や汚れあり、傷や汚れあり、全体的に状態が悪い」の7項目から選択肢しないと出品できない'do
      # end

      it '配送料の負担の情報が空だと出品できない' do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end

      # it '配送料の負担は、「---、着払い(購入者負担)、送料込み(出品者負担)」の3項目から選択しないと出品できない' do
      # end

      it '発送元の地域の情報が空だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      # it '発送元の地域は、「---」と47都道府県の合計48項目から選択しないと出品できない' do
      # end
        
      it '発送までの日数の情報が空だと出品できない' do
        @item.duration_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Duration can't be blank"
      end

      # it '発送までの日数は、「---、1~2日で発送、2~3日で発送、4~7日で発送」の4項目から選択しないと出品できない' do
      # end

      it '価格の情報が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格は、¥300以上じゃないと出品ができない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end
      
      it '価格は、¥9,999,999以下じゃないと出品ができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      it '価格は半角数値じゃないと出品できない' do
        @item.price ='１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is invalid"
      end

      # it '入力された価格によって、販売手数料や販売利益の表示が変わらないと出品できない' do
      # end
    end

  end
end
