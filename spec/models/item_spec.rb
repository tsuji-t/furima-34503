require 'rails_helper'

# bundle exec rspec spec/models/item_spec.rb

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
 
  describe '商品出品登録' do
    it '登録情報が全て存在すれば登録できる' do
      expect(@item).to be_valid
    end
    
    it 'タイトルが空だと登録できない' do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品説明が空だと登録できない' do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーがーーだと登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it '商品状態がーーだと登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it '商品送料がーーだと登録できない' do
      @item.shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 1")
    end

    it '商品出産地がーーだと登録できない' do
      @item.state_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("State must be other than 1")
    end

    it '出品日数がーーだと登録できない' do
      @item.arrival_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Arrival must be other than 1")
    end

    it '値段が空だと登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list", "Price is invalid")
    end

    it '値段が全角数字だと登録できない' do
      @item.price = "１０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '値段が300より低いと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it '値段が9,999,999より大きいと登録できない' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

  end
end
