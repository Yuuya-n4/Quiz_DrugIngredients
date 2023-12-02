require 'rails_helper'

RSpec.describe 'User profile editing', type: :system do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit profile_mypages_path
  end

  it 'ユーザーが名前を変更できる' do
    fill_in '名前', with: '新しい名前'
    click_button '更新する'

    expect(page).to have_content('プロフィールを更新しました。')
    expect(user.reload.name).to eq '新しい名前'
  end

  it 'ユーザーがメールアドレスを変更できる' do
    fill_in 'メールアドレス', with: 'newemail@example.com'
    click_button '更新する'

    expect(page).to have_content('プロフィールを更新しました。')
    expect(user.reload.email).to eq 'newemail@example.com'
  end

  it 'ユーザーがパスワードを変更できる' do
    fill_in 'パスワード', with: 'newpassword'
    fill_in '確認用パスワード', with: 'newpassword'
    fill_in '現在のパスワード', with: user.password
    click_button '更新する'

    expect(page).to have_content('プロフィールを更新しました。')
  end

  it '名前が空白だとエラーが表示される' do
    fill_in '名前', with: ''
    click_button '更新する'
  
    expect(page).to have_content('名前を入力してください')
  end

  it 'メールアドレスが空白だとエラーが表示される' do
    fill_in 'メールアドレス', with: ''
    click_button '更新する'
  
    expect(page).to have_content('メールアドレスを入力してください')
  end

  it '確認用パスワードが空白だとエラーが表示される' do
    fill_in 'パスワード', with: 'newpassword'
    fill_in '確認用パスワード', with: ''
    fill_in '現在のパスワード', with: user.password
    click_button '更新する'
  
    expect(page).to have_content('確認用パスワードとパスワードの入力が一致しません')
  end
end