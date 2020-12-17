require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,first_name,last_name,first_name_reading,last_name_reading,bathdateが存在すれば登録できる" do
        @user.email = "kk.1989@gmail.com"
        @user.password = "kk1989"
        @user.password_confirmation = "kk1989"
        expect(@user).to be_valid
      end
      it "emailに@が含まれれば登録できる" do
        @user.email = "kk.1989@gmail.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上で半角英数字であれば登録できる" do
        @user.password = "kk19890"
        @user.password_confirmation = "kk19890"
        expect(@user).to be_valid
      end
      it "first_name,last_nameが全角文字であれば登録できる" do
        @user.first_name = "康平"
        @user.last_name = "川島"
        expect(@user).to be_valid
      end
      it "first_name_reading,last_name_readingが全角カナであれば登録できる" do
        @user.first_name_reading = "コウヘイ"
        @user.last_name_reading = "カワシマ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@が含まれなければ登録できない" do
        @user.email = "kk.1989gmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字を含まなければ登録できない" do
        @user.password = "0000000"
        @user.password_confirmation = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でなければ登録できない" do
        @user.first_name = "kawashima"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameが存在しなければ登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角でなければ登録できない" do
        @user.last_name = "kawashima"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_name_readingが空では登録できない" do
        @user.first_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it "first_name_readingが全角カナでなければ登録できない" do
        @user.first_name_reading = "kawashima"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid")
      end
      it "last_name_readingが空であればば登録できない" do
        @user.last_name_reading = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it "last_name_readingが全角カナでなければ登録できない" do
        @user.last_name_reading = "kawashima"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid")
      end
      it "birthdateが空だと登録できない" do
        @user.birthdate = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdate can't be blank")
      end
    end
  end
end


