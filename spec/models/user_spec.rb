require 'rails_helper'

# bundle exec rspec spec/models/user_spec.rb 

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    it '全て存在すれば正常に登録できる' do
      expect(@user).to be_valid
    end

    it "ニックネームが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'メールアドレスが空では登録できないこと'do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'メールアドレスは@を含まないと登録出来ない' do
      @user.email = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'メールアドレスが同じだと登録で出来ない'do
      @user.save
      @another_user = FactoryBot.build(:user)
      @another_user.email = @user.email
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'パスワードが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
    end

    it 'パスワードは、6文字以上でないと登録出来ない' do
      @user.password = "aaa11"
      @user.password_confirmation = "aaa11"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください", "パスワードは不正な値です")
    end

    it 'パスワードは、半角英数字混合での入力がないと登録出来ない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'パスワードが数字のみでは登録できない' do
      @user.password = "111111"
      @user.password_confirmation = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'パスワードが全角だと登録できない' do
      @user.password = "ＡＡＡ１１１"
      @user.password_confirmation = "ＡＡＡ１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは不正な値です")
    end

    it 'パスワード（確認）が空だと、登録出来ない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      
    end
    it 'パスワードとパスワード（確認）が、一致がしないと登録できない' do
      @user.password = "aaa111"
      @user.password_confirmation = "bbb222"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end



    it 'ユーザー苗字が空だと登録できない' do
      @user.last_name_full = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角:苗字)を入力してください", "お名前(全角:苗字)は不正な値です")
    end

    it 'ユーザー名前が空だと登録できない' do
      @user.first_name_full = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角:名前)を入力してください", "お名前(全角:名前)は不正な値です")
    end

    it 'ユーザー苗字は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name_full = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角:苗字)は不正な値です")
    end

    it 'ユーザー名前は、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name_full = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前(全角:名前)は不正な値です")
    end

    it 'ユーザー苗字フリガナが空だと登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角:苗字)を入力してください", "お名前カナ(全角:苗字)は不正な値です")
    end

    it 'ユーザー名前フリガナが空だと登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角:名前)を入力してください", "お名前カナ(全角:名前)は不正な値です")
    end

    it 'ユーザー苗字フリガナは、全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角:苗字)は不正な値です")
    end

    it 'ユーザー名前フリガナは、全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前カナ(全角:名前)は不正な値です")
    end
    it '生年月日がからだと登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end

