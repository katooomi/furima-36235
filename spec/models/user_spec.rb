require 'rails_helper'
 RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    end

  it 'nicknameとemail、passwordとpassword_confirmation、名字(全角)と名前(全角)、名字(カナ)と名前(カナ)、生年月日が存在すれば登録できること' do
    expect(@user).to be_valid
  end

describe 'ユーザー新規登録' do
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
  
  it 'emaiiが一意性であること' do
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

  it 'passwordは６文字以上の入力で登録できる'do
    @user.password = '123abc'
    @user.password_confirmation = '123abc'
    expect(@user).to be_valid
  end

  it 'passwordは半角絵文字混同で登録できる'do
     @user.password ='123456'
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
    end
  end
 