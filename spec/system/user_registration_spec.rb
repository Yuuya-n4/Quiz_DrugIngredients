require 'rails_helper'

RSpec.describe 'User registration', type: :system do

  it 'ユーザー登録が成功し、自動ログインされ、トップページにリダイレクトされる' do
    visit new_user_registration_path

    fill_in '名前', with: 'テストユーザー'
    fill_in 'メールアドレス', with: 'test@example.com'
    fill_in 'パスワード', with: 'password'
    fill_in '確認用パスワード', with: 'password'
    select '男性', from: '性別'
    select '20', from: '年齢'

    click_button '登録'

    expect(page).to have_content 'ようこそ！ アカウントが登録されました'
    expect(page).to have_content 'ログアウト'
    expect(current_path).to eq root_path
  end

  it '不正な入力でユーザー登録が失敗する' do
    visit new_user_registration_path

    fill_in '名前', with: ''
    fill_in 'メールアドレス', with: ''
    fill_in 'パスワード', with: 'abc'
    fill_in '確認用パスワード', with: 'def'
    select '男性', from: '性別'
    select '20', from: '年齢'

    click_button '登録'

    expect(page).to have_content '名前を入力してください'
    expect(page).to have_content 'メールアドレスを入力してください'
    expect(page).to have_content 'パスワードは6文字以上で入力してください'
    expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
  end

  it '既に登録されているメールアドレスを使うと登録が失敗する' do
    existing_user = FactoryBot.create(:user)
    visit new_user_registration_path

    fill_in '名前', with: '新規ユーザー'
    fill_in 'メールアドレス', with: existing_user.email
    fill_in 'パスワード', with: 'password'
    fill_in '確認用パスワード', with: 'password'
    select '男性', from: '性別'
    select '20', from: '年齢'

    click_button '登録'

    expect(page).to have_content 'メールアドレスはすでに存在します'
  end
end