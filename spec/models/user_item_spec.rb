require 'rails_helper'
describe UserItem do
  before do
    @user_item = FactoryBot.build(:user_item)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@user_item).to be_valid
      end

      it 'building_nameは空でも保存できること' do
        @user_item.building_name = nil
        expect(@user_item).to be_valid
      end
    end
  end

  describe '商品購入機能' do
    context '商品購入がうまくいかないとき' do
      it 'tokenが空では登録できないこと' do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では登録できないこと' do
        @user_item.postal_code = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
        @user_item.postal_code = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefectureを選択していないと登録できないこと' do
        @user_item.prefecture_id = 0
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では登録できないこと' do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できないこと' do
        @user_item.house_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では登録できないこと' do
        @user_item.phone_number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが１１文字以上であれば登録できないこと' do
        @user_item.phone_number = '123456789012'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
