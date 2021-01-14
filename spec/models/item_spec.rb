require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "内容に問題がない場合、登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "titleが空だと登録できない" do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "textが空だと登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "画像が空だと登録できない" do
        @item.image = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      
      it "category_idが空だと登録できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_idが空だと登録できない" do
        @item.shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_to_ship_idが空だと登録できない" do
        @item.day_to_ship_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it "condition_idが1以外でないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "condition_idが1以外でないと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "shipping_idが1以外でないと登録できない" do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end
      it "prefecture_idが1以外でないと登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "day_to_ship_id1以外でないと登録できない" do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end
      it "priceが半角数字でなければ登録できない" do
        @item.price = "値段"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが半角英数字混合では登録できない" do
        @item.price = "price10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが半角英字では登録できない" do
        @item.price = "price"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが300以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceが10000000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end


