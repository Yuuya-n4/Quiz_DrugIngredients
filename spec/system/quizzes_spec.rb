require 'rails_helper'

RSpec.describe 'Quizzes', type: :system do
  before do
    @user = create(:user)
    @quiz_set = create(:quiz_set)
  end

  it 'ユーザーがクイズに10問正解し、10問正解のスコアが表示される' do
    login_as(@user, scope: :user)

    visit quiz_set_path(@quiz_set)

    find_button('クイズを始める').click

    @quiz_set.quizzes.each do |quiz|
      visit quiz_set_quiz_path(@quiz_set, quiz)
      correct_choice = quiz.choices.find_by(correct: true)
      find_button(correct_choice.text).click

      if quiz != @quiz_set.quizzes.last
        click_button '次へ'
      else
        click_button 'スコアを見る'
      end
    end

    expect(page).to have_content('スコア:')
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('あなたのスコア: 10 / 10 問')

    visit scores_mypages_path
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('10 / 10')
  end

  it 'ユーザーがクイズに０問正解し、０問正解のスコアが表示される' do
    login_as(@user, scope: :user)

    visit quiz_set_path(@quiz_set)

    find_button('クイズを始める').click

    @quiz_set.quizzes.each do |quiz|
      visit quiz_set_quiz_path(@quiz_set, quiz)
      incorrect_choices = quiz.choices.where(correct: false)
      find_button(incorrect_choices.first.text).click

      if quiz != @quiz_set.quizzes.last
        click_button '次へ'
      else
        click_button 'スコアを見る'
      end
    end

    expect(page).to have_content('スコア:')
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('あなたのスコア: 0 / 10 問')

    visit scores_mypages_path
    expect(page).to have_content(@quiz_set.title)
    expect(page).to have_content('0 / 10')
  end
end