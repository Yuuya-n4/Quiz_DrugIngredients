require 'rails_helper'

RSpec.describe 'User login', type: :system do
  let!(:user) { FactoryBot.create(:user) }

  before do
    driven_by(:rack_test)
  end

  it '正しい情報でログインできる' do
    visit new_user_session_path

    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: user.password
    click_button 'ログイン'

    expect(page).to have_content 'ログインしました'
    expect(current_path).to eq root_path
  end

  it '誤った情報ではログインできない' do
    visit new_user_session_path

    fill_in 'メールアドレス', with: 'wrong@example.com'
    fill_in 'パスワード', with: 'wrongpassword'
    click_button 'ログイン'

    expect(page).to have_content 'メールアドレスまたはパスワードが違います'
  end

  it 'ログアウトできる' do
    sign_in user
    visit root_path

    click_link 'ログアウト'
    expect(page).to have_content 'ログアウトしました'
    expect(current_path).to eq root_path
  end
end