require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、Email、パスワードがあればユーザーは有効" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "名前がなければユーザーは無効" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors.full_messages).to include("名前を入力してください")
  end

  it "メールがなければユーザーは無効" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスを入力してください")
  end

  it "メールアドレスの重複は無効" do
    create(:user, email: "test@example.com")
    user = build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスはすでに存在します")
  end

  it "メールアドレスの不正な形式は無効" do
    user = build(:user, email: "invalid_email")
    user.valid?
    expect(user.errors.full_messages).to include("メールアドレスは不正な値です")
  end

  it "パスワードがなければユーザーは無効" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors.full_messages).to include("パスワードを入力してください")
  end

  it "パスワードが短すぎると無効" do
    user = build(:user, password: "short")
    user.valid?
    expect(user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
  end
end