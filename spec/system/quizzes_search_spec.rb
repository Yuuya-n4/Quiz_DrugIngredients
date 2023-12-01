require 'rails_helper'

RSpec.describe 'Quizzes Search', type: :system do

  before do
    quiz_sets = create_list(:quiz_set, 5)

    @specific_quiz = create(:quiz, quiz_set: quiz_sets.last, question: '特定の質問', explanation: '特定の解説', drug_type: 5)
    @specific_quiz.choices.destroy_all
    create(:choice, quiz: @specific_quiz, text: '特定の正解', correct: true)
    create_list(:choice, 2, quiz: @specific_quiz, text: '特定の不正解', correct: false)

    @user = create(:user)
    login_as(@user, scope: :user)

    visit quizzes_path
  end

  it 'searches quizzes by a specific question' do
    fill_in 'combined_search', with: '特定の質問'
    click_on '検索'
    expect(page).to have_content '特定の質問'
  end

  it 'searches quizzes by a specific correct answer' do
    fill_in 'combined_search', with: '特定の正解'
    click_on '検索'
    expect(page).to have_content '特定の正解'
  end

  it 'searches quizzes by a specific explanation' do
    fill_in 'combined_search', with: '特定の解説'
    click_on '検索'
    expect(page).to have_content '特定の解説'
  end

  it 'searches quizzes by a specific quiz set title' do
    fill_in 'combined_search', with: @specific_quiz.quiz_set.title
    click_on '検索'
    expect(page).to have_content @specific_quiz.quiz_set.title
  end
end