require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do 
      it 'nickname, email, password, password_confirmation, last_name, last_name_ruby, first_name, first_name_ruby, birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数混合で6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '阿いウ'
        expect(@user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '阿いウ'
        expect(@user).to be_valid
      end
      it 'first_name_rubyは、全角（カタカナ）であれば登録できる' do
        @user.first_name_ruby = 'アイウエオ'
        expect(@user).to be_valid
      end
      it 'last_name_rubyは、全角（カタカナ）であれば登録できる' do
        @user.last_name_ruby = 'アイウエオ'
        expect(@user).to be_valid
      end

    end
    context '新規登録できないとき' do 
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_rubyが空では登録できない' do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'last_nameにローマ字を使うと登録できない' do
        @user.last_name = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'last_nameに記号を使うと登録できない' do
        @user.last_name = "：＠「＝"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'last_nameに数字を使うと登録できない' do
        @user.last_name = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'first_nameにローマ字を使うと登録できない' do
        @user.first_name = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'first_nameに記号を使うと登録できない' do
        @user.first_name = "：＠「＝"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'first_nameに数字を使うと登録できない' do
        @user.first_name = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'last_name_rubyにローマ字を使うと登録できない' do
        @user.last_name_ruby = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに記号を使うと登録できない' do
        @user.last_name_ruby = "：＠「＝"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに数字を使うと登録できない' do
        @user.last_name_ruby = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに漢字を使うと登録できない' do
        @user.last_name_ruby = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'first_name_rubyにローマ字を使うと登録できない' do
        @user.first_name_ruby = "abcde"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに記号を使うと登録できない' do
        @user.first_name_ruby = "：＠「＝"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに数字を使うと登録できない' do
        @user.first_name_ruby = 1234
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに漢字を使うと登録できない' do
        @user.first_name_ruby = "漢字"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'passwordに数字だけを使うと登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordにローマ字だけを使うと登録できない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'emailに@がないとと登録できない' do
        @user.email = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '同じemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが5文字以下の場合、登録できないこと' do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが全角では登録できないこと' do
        @user.password = "A１２３４５"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

    end

  end
end