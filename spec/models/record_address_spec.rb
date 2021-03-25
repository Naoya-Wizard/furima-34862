require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '購入情報とアドレス情報が保存されること' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @record_address = FactoryBot.build(:record_address, user_id: user.id, product_id: product.id)
      sleep 0.2
    end
    context '登録できる場合' do
      it '全ての情報が正しく入力されていると登録できる' do
        expect(@record_address).to be_valid
      end
      it 'buildingnameが空でも登録できる' do
        @record_address.buildingname = ""
        expect(@record_address).to be_valid
      end
    end

    context '登録できない場合' do
      it 'postcodeが空では登録できない' do
        @record_address.postcode = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'prefecture_idが1(非選択)では登録できない' do
        @record_address.prefecture_id = 1
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'municipalityが空では登録できない' do
        @record_address.municipality = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では登録できない' do
        @record_address.address = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phonenumberが空では登録できない' do
        @record_address.phonenumber = ""
        @record_address.valid?        
        expect(@record_address.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'user_idがなければ登録できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idがなければ登録できない' do
        @record_address.product_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'postcodeはハイフンがないと登録できない' do
        @record_address.postcode = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode Input correctly")
      end
      it 'postcodeは７桁でないと登録できない' do
        @record_address.postcode = '123-456'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode Input correctly")
      end
      it 'postcodeは数字以外では登録できない' do
        @record_address.postcode = "aかA@;:-"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Postcode Input correctly")
      end
      it 'phonenumberは半角数字以外では登録できない' do
        @record_address.phonenumber = 'Abc;:.１２３４５６７８９'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phonenumber Input only number")
      end
      it 'tokenが空では登録できない' do
        @record_address.token = ""
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it '電話番号は12桁以上では登録できない' do
        @record_address.phonenumber = "123456789123"
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phonenumber out of range")
      end
    end
  end
end
