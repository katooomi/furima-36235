require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user_id = FactoryBot.build(:user)
  end
    
  describe '出品する'  do
    context 'ユーザーが新規登録できる時' do
      it 'nicknameとemail、passwordとpassword_confirmation、名字(全角)と名前(全角)、名字(カナ)と名前(カナ)、生年月日が存在すれば登録できること' do
      expect(@user).to be_valid
      end
   end

   context 'ユーザー新規登録できない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
  
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    
    it 'emailが一意性であること' do
      @user.save
      another_user =FactoryBot.build(:user,email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  
    it 'emailは＠がないと登録できない' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
  
    it 'passwordは６文字以上の入力で登録できる' do
      @user.password = '123abc'
      @user.password_confirmation = '123abc'
      expect(@user).to be_valid
    end
  
    it 'passwordは半角の数字のみでは登録できない' do
       @user.password ='123456'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    
    it 'passwordは半角の英語のみでは登録できない' do
       @user.password ='abcdef'
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  
    it 'passwordとpassword_confirmationが一致すれば登録できる' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  
    it '名字(全角)が空では登録できない' do
      @user.last_name =''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
  
    it '名前(全角)が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
  
    it '名前(全角)は全角（漢字・ひらがな・カタカナ）の入力で登録できる' do
      @user.first_name = 'Yamada'
      @user.last_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください", "Last name 全角文字を使用してください"
    end
  
    it '名前(カナ)は名字は空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank" 
    end
  
    it '名前(カナ)は名前は空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name kana can't be blank"
    end
  
    it '生年月日が空では登録できない' do
      @user.birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth can't be blank"
    end  
  
    it 'パスワードが全角では登録できない' do
      @user.password = 'a a a a a a'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'パスワードが５文字以下では登録できない' do
      @user.password = '123ab'
      @user.password_confirmation = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '苗字が漢字・平仮名・カタカナ以外では登録できない' do
      @user.last_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include  "Last name 全角文字を使用してください"
    end
     
    it '名前が漢字・平仮名・カタカナ以外では登録できない' do
      @user.first_name = 'Bob'
      @user.valid?
      expect(@user.errors.full_messages).to include  "First name 全角文字を使用してください"
    end

    it 'フリガナ（苗字）が全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana 全角文字を使用してください"
    end
    
    it 'フリガナ（名前）が全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角文字を使用してください"
    end
  end
end
end
