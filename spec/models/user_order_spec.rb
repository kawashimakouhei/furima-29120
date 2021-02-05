require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal_code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @user_order.prefecture = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityは空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("city can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @user_order.house_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("house_number can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("phone_number can't be blank")
　  end
    it 'phone_numberが11文字以上だと保存できないこと' do
      user_order.phone_number = 111111111111
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("phone_number is out of setting range")
    end
    it 'building_nameは空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end

    it "priceとtokenがあれば保存ができること" do
      expect(@user_order).to be_valid
    end
  
    it "priceが空では登録できないこと" do
      @user_order.price = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Price can't be blank")
    end
  
    it "tokenが空では登録できないこと" do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end
    
  end
end

