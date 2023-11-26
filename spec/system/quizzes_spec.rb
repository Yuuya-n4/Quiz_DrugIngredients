require 'rails_helper'

RSpec.describe 'Quizzes', type: :system do
  before do
    @user = create(:user)
    @quiz_set = create(:quiz_set)
    3.times do |n|
      quiz = create(:quiz, quiz_set: @quiz_set, question: "クイズの質問 #{n + 1}")
      create(:correct_choice, quiz: quiz)
      2.times { create(:incorrect_choice, quiz: quiz) }
    end
    @first_quiz = @quiz_set.quizzes.first
  end

  it 'ユーザーがクイズに３問正解し、３問正解のスコアが表示される' do
    login_as(@user, scope: :user)

    visit root_path

    click_link @quiz_set.title

    click_link 'クイズを始める'

    @quiz_set.quizzes.each do |quiz|
      correct_choice = quiz.choices.find_by(correct: true)
      find_button(correct_choice.text).click

      if quiz != @quiz_set.quizzes.last
        click_link '次へ'
      else
        click_link 'スコアを見る'
      end
    end

    expect(page).to have_content('あなたのスコア:')
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('正解数: 3 / 3 問')
  end

  it 'ユーザーがクイズに０問正解し、０問正解のスコアが表示される' do
    login_as(@user, scope: :user)

    visit root_path

    click_link @quiz_set.title

    click_link 'クイズを始める'

    @quiz_set.quizzes.each do |quiz|
      incorrect_choices = all('button', text: '不正解の選択肢')
      incorrect_choices[0].click

      if quiz != @quiz_set.quizzes.last
        click_link '次へ'
      else
        click_link 'スコアを見る'
      end
    end

    expect(page).to have_content('あなたのスコア:')
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('正解数: 0 / 3 問')
  end
end