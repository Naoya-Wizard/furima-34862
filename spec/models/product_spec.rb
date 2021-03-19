require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品の保存' do    
    context '保存できる時' do
      it 'name,description,category_id,status_id,delivery_fee_id,prefecture_id,delivery_day_id,price,imageがあれば登録できる' do
        expect(@product).to be_valid
      end
    end
    context '保存できない時' do
      it 'nameが空では登録できない' do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'discriptionが空では登録できない' do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category Select")
      end
      it 'status_idが空では登録できない' do
        @product.status_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status Select")
      end
      it 'delivery_fee_idが空では登録できない' do
        @product.delivery_fee_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee Select")
      end
      it 'prefecture_idが空では登録できない' do
        @product.prefecture_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture Select")
      end
      it 'delivery_day_idが空では登録できない' do
        @product.delivery_day_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery day Select")
      end
      it 'priceが空では登録できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'priceが全角数字では登録できない' do
        @product.price = "１２３４"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが半角ローマ字では登録できない' do
        @product.price = "ABcd"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが全角ローマ字では登録できない' do
        @product.price = "zENkAkU"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceがひらがなでは登録できない' do
        @product.price = "ひらがな"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが記号では登録できない' do
        @product.price = "-@;:"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが漢字では登録できない' do
        @product.price = "漢字"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Half-width number")
      end
      it 'priceが300未満では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end
      it 'priceが9999999より大きい値では登録できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price Out of setting range")
      end
    end
  end

end
