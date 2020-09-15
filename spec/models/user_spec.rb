require 'rails_helper'
RSpec.describe User do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれない場合は登録できないこと' do
      @user.email = 'kkkgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが６文字以上であれば登録できること' do
      @user.password = '1234Aa'
      @user.password_confirmation = '1234Aa'
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字のみであれば登録できないこと' do
      @user.password = 'TTTttt'
      @user.password_confirmation = 'TTTttt'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input both letters and numbers.')
    end

    it 'passwordが数字のみであれば登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Input both letters and numbers.')
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid. Input full-width characters.')
    end

    it 'fist_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
      @user.first_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid. Input full-width characters.')
    end

    it 'family_nameが空だと保存できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid. Input full-width characters.')
    end

    it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
      @user.family_name = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width characters.')
    end

    it 'first_name_kanaが空だと保存できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid. Input full-width katakana characters.')
    end

    it 'first_name_kanaが全角（カタカナ）でないと保存できないこと' do
      @user.first_name_kana = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid. Input full-width katakana characters.')
    end

    it 'family_name_kanaが空だと保存できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana is invalid. Input full-width katakana characters.')
    end

    it 'family_name_kanaが全角（カタカナ）でないと保存できないこと' do
      @user.family_name_kana = 'suzuki'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid. Input full-width katakana characters.')
    end

    it 'birth_dayを選択していないと保存できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
