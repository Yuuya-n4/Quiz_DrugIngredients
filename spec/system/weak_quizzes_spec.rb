require 'rails_helper'

RSpec.describe 'WeakQuizzes', type: :system do
  before do
    @user = create(:user)
    @quiz_sets = create_list(:quiz_set, 3)

    @quiz_set = create(:quiz_set)

    login_as(@user, scope: :user)
  end

  it 'ユーザーが全てのクイズに2回正解した後、苦手クイズを開くと、「定着したクイズの数: 30問」と表示される' do
    2.times do
      @quiz_sets.each do |quiz_set|
        visit quiz_set_path(quiz_set)
        find_button('クイズを始める').click

        quiz_set.quizzes.each do |quiz|
          visit quiz_set_quiz_path(quiz_set, quiz)
          correct_choice = quiz.choices.find_by(correct: true)
          find_button(correct_choice.text).click

          if page.has_link?('次へ')
            click_link '次へ'
          elsif page.has_link?('スコアを見る')
            click_link 'スコアを見る'
            expect(page).to have_content('あなたのスコア:')
            expect(page).to have_content(quiz_set.title)
            expect(page).to have_content('正解数: 10 / 10 問')
          end
        end
      end
    end
  
    visit start_weak_quizzes_path
    expect(page).to have_content('定着したクイズの数:')
    expect(page).to have_content('30問')
  end

  it 'ユーザーが全てのクイズに2回不正解した後、苦手クイズを開くと、「苦手と判定されたクイズの数: 30問」と表示される' do
    2.times do
      @quiz_sets.each do |quiz_set|
        visit quiz_set_path(quiz_set)
        find_button('クイズを始める').click

        quiz_set.quizzes.each do |quiz|
          visit quiz_set_quiz_path(quiz_set, quiz)
          incorrect_choices = quiz.choices.where(correct: false)
          find_button(incorrect_choices.first.text).click

          if page.has_link?('次へ')
            click_link '次へ'
          elsif page.has_link?('スコアを見る')
            click_link 'スコアを見る'
            expect(page).to have_content('あなたのスコア:')
            expect(page).to have_content(quiz_set.title)
            expect(page).to have_content('正解数: 0 / 10 問')
          end
        end
      end
    end
  
    visit start_weak_quizzes_path
    expect(page).to have_content('苦手と判定されたクイズの数:')
    expect(page).to have_content('30問')
  end

  it 'ユーザーが全てのクイズに2回不正解した後、全てのクイズに2回連続で正解し苦手クイズを開くと、「苦手を克服したクイズの数:  30問」と表示される2' do
    2.times do
      @quiz_sets.each do |quiz_set|
        visit quiz_set_path(quiz_set)
        find_button('クイズを始める').click

        quiz_set.quizzes.each do |quiz|
          visit quiz_set_quiz_path(quiz_set, quiz)
          incorrect_choices = quiz.choices.where(correct: false)
          find_button(incorrect_choices.first.text).click

          if page.has_link?('次へ')
            click_link '次へ'
          elsif page.has_link?('スコアを見る')
            click_link 'スコアを見る'
            expect(page).to have_content('あなたのスコア:')
            expect(page).to have_content(quiz_set.title)
            expect(page).to have_content('正解数: 0 / 10 問')
          end
        end
      end
    end

    visit start_weak_quizzes_path
    expect(page).to have_content('苦手と判定されたクイズの数:')
    expect(page).to have_content('30問')

    2.times do
      @quiz_sets.each do |quiz_set|
        visit quiz_set_path(quiz_set)
        find_button('クイズを始める').click

        quiz_set.quizzes.each do |quiz|
          visit quiz_set_quiz_path(quiz_set, quiz)
          correct_choice = quiz.choices.find_by(correct: true)
          find_button(correct_choice.text).click
  
          if page.has_link?('次へ')
            click_link '次へ'
          elsif page.has_link?('スコアを見る')
            click_link 'スコアを見る'
            expect(page).to have_content('あなたのスコア:')
            expect(page).to have_content(quiz_set.title)
            expect(page).to have_content('正解数: 10 / 10 問')
          end
        end
      end
    end
  
    visit start_weak_quizzes_path
    expect(page).to have_content('苦手を克服したクイズの数:')
    expect(page).to have_content('30問')
  end

  it 'ユーザーが1つのクイズセットに対して2回挑戦し全て不正解した後、苦手クイズに2回挑み全て正解すると、「苦手を克服したクイズの数: 30問」と表示される' do
    2.times do
      visit quiz_set_path(@quiz_set)
      find_button('クイズを始める').click

      @quiz_set.quizzes.each do |quiz|
        visit quiz_set_quiz_path(@quiz_set, quiz)
        incorrect_choices = quiz.choices.where(correct: false)
        find_button(incorrect_choices.first.text).click

        if page.has_link?('次へ')
          click_link '次へ'
        elsif page.has_link?('スコアを見る')
          click_link 'スコアを見る'
        end
      end
    end

    visit start_weak_quizzes_path
    expect(page).to have_content('苦手と判定されたクイズの数:')
    expect(page).to have_content('10問')

    2.times do
        visit start_weak_quizzes_path
        find_button('クイズを始める').click
  
        @quiz_set.quizzes.each do |quiz|
          visit weak_quiz_path(quiz)
          correct_choice = quiz.choices.find_by(correct: true)
          find_button(correct_choice.text).click
  
          if page.has_link?('次へ')
            click_link '次へ'
          elsif page.has_link?('スコアを見る')
            click_link 'スコアを見る'
            expect(page).to have_content('正解数: 10 / 10')
          end
        end
      end

    visit start_weak_quizzes_path
    expect(page).to have_content('苦手を克服したクイズの数:')
    expect(page).to have_content('10問')
  end
end
