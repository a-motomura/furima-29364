require 'rails_helper'
RSpec.describe Item do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'introductionが空では登録できないこと' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Introduction can't be blank")
    end

    it 'categoryを選択していないと保存できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'statusを選択していないと保存できないこと' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'postageを選択していないと保存できないこと' do
      @item.postage = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @item.prefecture = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'preparation_dayを選択していないと保存できないこと' do
      @item.preparation_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation day can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字だと保存できないこと' do
      @item.price = '０'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end

    it 'priceが9999999円を超過すると保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
    end
  end
end
