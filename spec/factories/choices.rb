FactoryBot.define do
  factory :correct_choice, class: 'Choice' do
    quiz
    text { "正解の選択肢" }
    correct { true }
  end

  factory :incorrect_choice, class: 'Choice' do
    quiz
    text { "不正解の選択肢" }
    correct { false }
  end
end