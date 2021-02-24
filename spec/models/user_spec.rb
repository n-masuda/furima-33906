require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができるとき' do
      it '必須情報が正しく入力されると登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it 'ニックネームが必須である' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが必須である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性である' do
        @user.save
        user2 = FactoryBot.build(:user, email: @user.email)
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'メールアドレスは、@を含む必要がある' do
        @user.email = 'fgfg.prpr.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'パスワードが必須である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力が必須である' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは、半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password include both letters and numbers')
      end

      it 'パスワードは、半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password include both letters and numbers')
      end

      it 'パスワードは、全角では登録できない' do
        @user.password = '１ａｂｃｄｅｆ'
        @user.password_confirmation = '１ａｂｃｄｅｆ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password include both letters and numbers')
      end

      it 'パスワードは、確認用を含めて2回入力する' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードとパスワード（確認用）は、値の一致が必須である' do
        @user.password = '1abcde'
        @user.password_confirmation = '2abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名前が必須である' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名は、名字が必須である' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.first_name = 'fgfg'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.last_name = 'fgfg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'ユーザー本名のフリガナは、名前が必須である' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'ユーザー本名のフリガナは、名字が必須である' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'ユーザーの名前は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.first_name_kana = 'ふがふが'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width KTAKANA characters')
      end

      it 'ユーザーの名字は、全角（漢字・ひらがな・カタカナ）での入力が必須である' do
        @user.last_name_kana = 'ふがふが'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width KTAKANA characters')
      end

      it '生年月日が必須である' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
