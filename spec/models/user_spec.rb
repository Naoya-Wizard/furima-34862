require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    test_column = {nickname: 'furimatarou', email: 'test@example', password: 'a11111', password_confirmation: 'a11111', last_name: '山田', first_name: '太郎', last_name_ruby: 'ヤマダ', first_name_ruby: 'タロウ', birthday: '1985-10-30'}

    context '新規登録できるとき' do 
      it 'nickname, email, password, password_confirmation, last_name, last_name_ruby, first_name, first_name_ruby, birthdayがあれば登録できる' do
        user = User.new(test_column)
        expect(user).to be_valid
      end
      it 'passwordとpassword_confirmationが英数混合で6文字以上であれば登録できる' do
        user = User.new(test_column)
        user.password = 'abc123'
        user.password_confirmation = 'abc123'
        expect(user).to be_valid
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        user = User.new(test_column)
        user.last_name = '阿いウ'
        expect(user).to be_valid
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        user = User.new(test_column)
        user.first_name = '阿いウ'
        expect(user).to be_valid
      end
      it 'first_name_rubyは、全角（カタカナ）であれば登録できる' do
        user = User.new(test_column)
        user.first_name_ruby = 'アイウエオ'
        expect(user).to be_valid
      end
      it 'last_name_rubyは、全角（カタカナ）であれば登録できる' do
        user = User.new(test_column)
        user.last_name_ruby = 'アイウエオ'
        expect(user).to be_valid
      end

    end
    context '新規登録できないとき' do 
      it 'nicknameが空では登録できない' do
        user = User.new(test_column)
        user.nickname = ""
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end
    
      it 'emailが空では登録できない' do
        user = User.new(test_column)
        user.email = ""
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        user = User.new(test_column)
        user.password = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        user = User.new(test_column)
        user.password_confirmation = ""
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        user = User.new(test_column)
        user.last_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameが空では登録できない' do
        user = User.new(test_column)
        user.first_name = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_name_rubyが空では登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'first_name_rubyが空では登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = ""
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby can't be blank")
      end

      it 'birthdayが空では登録できない' do
        user = User.new(test_column)
        user.birthday = ""
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'last_nameにローマ字を使うと登録できない' do
        user = User.new(test_column)
        user.last_name = "abcde"
        user.valid?
        expect(user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'last_nameに記号を使うと登録できない' do
        user = User.new(test_column)
        user.last_name = "：＠「＝"
        user.valid?
        expect(user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'last_nameに数字を使うと登録できない' do
        user = User.new(test_column)
        user.last_name = 1234
        user.valid?
        expect(user.errors.full_messages).to include("Last name Full-width characters")
      end

      it 'first_nameにローマ字を使うと登録できない' do
        user = User.new(test_column)
        user.first_name = "abcde"
        user.valid?
        expect(user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'first_nameに記号を使うと登録できない' do
        user = User.new(test_column)
        user.first_name = "：＠「＝"
        user.valid?
        expect(user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'first_nameに数字を使うと登録できない' do
        user = User.new(test_column)
        user.first_name = 1234
        user.valid?
        expect(user.errors.full_messages).to include("First name Full-width characters")
      end

      it 'last_name_rubyにローマ字を使うと登録できない' do
        user = User.new(test_column)
        user.last_name_ruby = "abcde"
        user.valid?
        expect(user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに記号を使うと登録できない' do
        user = User.new(test_column)
        user.last_name_ruby = "：＠「＝"
        user.valid?
        expect(user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに数字を使うと登録できない' do
        user = User.new(test_column)
        user.last_name_ruby = 1234
        user.valid?
        expect(user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'last_name_rubyに漢字を使うと登録できない' do
        user = User.new(test_column)
        user.last_name_ruby = "漢字"
        user.valid?
        expect(user.errors.full_messages).to include("Last name ruby Full-width katakana characters")
      end

      it 'first_name_rubyにローマ字を使うと登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = "abcde"
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに記号を使うと登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = "：＠「＝"
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに数字を使うと登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = 1234
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end

      it 'first_name_rubyに漢字を使うと登録できない' do
        user = User.new(test_column)
        user.first_name_ruby = "漢字"
        user.valid?
        expect(user.errors.full_messages).to include("First name ruby Full-width katakana characters")
      end
    end
    
  end
end