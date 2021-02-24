require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '購入情報の登録' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
    end

    context '購入情報を登録できるとき' do
      it 'すべての値が正しく入力されていれば登録できる' do
        expect(@form).to be_valid
      end
      it '建物名がなくても登録できる' do
        @form.add_line2 = ''
        expect(@form).to be_valid
      end
    end

    context '購入情報を登録できないとき' do
      it '郵便番号の情報がが必須である' do
        @form.postal_code = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は適切な位置に-が記載されないと登録できない' do
        @form.postal_code = '12-34567'
        @form.valid?
        expect(@form.errors.full_messages).to include('Postal code incorrect')
      end
      it '都道府県の情報が必須である' do
        @form.prefecture_id = 0
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村の情報が必須である' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it '番地の情報が必須である' do
        @form.add_line1 = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Add line1 can't be blank")
      end
      it '電話番号が必須である' do
        @form.phone = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は11桁以下でないと登録できない' do
        @form.phone = '123456789012'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it '電話番号は全角数字では登録できない' do
        @form.phone = '１２３４５６７８９０'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone is not a number')
      end
      it '電話番号は半角英字では登録できない' do
        @form.phone = 'aaaaaaaaaaa'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone is not a number')
      end
      it 'カード情報が有効でないと登録できない' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
      it '購入したユーザーのidが必須である' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it '購入した商品のidが必須である' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
