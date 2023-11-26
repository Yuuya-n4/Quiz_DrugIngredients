FactoryBot.define do
  factory :score do
    user
    quiz_set
    correct_answer { 0 }
  end
end