require 'rails_helper'

RSpec.describe 'Quizzes Search', type: :system do

  before do
    quiz_sets = create_list(:quiz_set, 5)

    @specific_quiz = create(:quiz, quiz_set: quiz_sets.last, question: '特定の質問', explanation: '特定の解説', drug_type: 1)
    @specific_quiz.choices.destroy_all
    create(:choice, quiz: @specific_quiz, text: '特定の正解', correct: true)
    create_list(:choice, 2, quiz: @specific_quiz, text: '特定の不正解', correct: false)

    @user = create(:user)
    login_as(@user, scope: :user)

    visit quizzes_path
  end

  it '問題の内容でクイズを検索する' do
    fill_in 'combined_search', with: '特定の質問'
    click_on '検索'
    expect(page).to have_content '特定の質問'
  end

  it '正解の選択肢でクイズを検索する' do
    fill_in 'combined_search', with: '特定の正解'
    click_on '検索'
    expect(page).to have_content '特定の正解'
  end

  it '問題の解説でクイズを検索する' do
    fill_in 'combined_search', with: '特定の解説'
    click_on '検索'
    expect(page).to have_content '特定の解説'
  end

  it 'クイズセットのタイトルでクイズを検索する' do
    fill_in 'combined_search', with: @specific_quiz.quiz_set.title
    click_on '検索'
    expect(page).to have_content @specific_quiz.quiz_set.title
  end
end