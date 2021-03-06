require 'rails_helper'

# bundle exec rspec spec/models/history_order_spec.rb

RSpec.describe HistoryOrder, type: :model do
  before do
    @history_order = FactoryBot.build(:history_order)
    @history_order.user_id = FactoryBot.create(:user).id
    @history_order.item_id = FactoryBot.create(:item).id
  end

  describe '商品購入機能' do

    context '購入ができるとき' do
      it '必要な情報を適切に入力すると、商品の購入ができること' do
        expect(@history_order).to be_valid
      end

      it '建物情報が空でも登録できる' do
        @history_order.building = ""
        expect(@history_order).to be_valid
      end
    end


    context '購入ができないとき' do
      it 'クレジットカードのtokenが空では登録できないこと' do
        @history_order.token = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it '郵便番号が空では購入できない' do
        @history_order.postal = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号を入力してください", "郵便番号は無効です。ハイフンを入れて下さい。")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @history_order.postal = "1112222"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号は無効です。ハイフンを入れて下さい。")
      end

      it '郵便番号が数字出ないと購入できない' do
        @history_order.postal = "aaabbbb"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号は無効です。ハイフンを入れて下さい。")
      end

      it '郵便番号のハイフンの前が数字三桁でないと購入できない' do
        @history_order.postal = "11-2222"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号は無効です。ハイフンを入れて下さい。")
      end

      it '郵便番号のハイフンの後ろが数字四桁出ないと保存できない' do
        @history_order.postal = "111-222"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("郵便番号は無効です。ハイフンを入れて下さい。")
      end

      it '都道府県がーーでは購入できない' do
        @history_order.state_id = 1
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("都道府県を入力して下さい。")
      end

      it '市町村が空では購入できない' do
        @history_order.city = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("市区町村を入力してください")
      end

      it '番地が空だと購入できない' do
        @history_order.address = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号が空だと購入できない' do
        @history_order.phone = ""
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号を入力してください", "電話番号は不正な値です")
      end

      it '電話番号が12桁以上だと購入できない' do
        @history_order.phone = "000111122223"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が９桁未満だと購入できない' do
        @history_order.phone = "000111122"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it '電話番号が英数字混合だと購入できない' do
        @history_order.phone = "AAA11112222"
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'ユーザー情報が空だと購入できない' do
        @history_order.user_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("ユーザーを入力してください")
      end

      it '商品情報が空だと登録できない' do
        @history_order.item_id = nil
        @history_order.valid?
        expect(@history_order.errors.full_messages).to include("商品を入力してください")
      end
    end
  end
end
