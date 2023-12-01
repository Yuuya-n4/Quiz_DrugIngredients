FactoryBot.define do
  factory :quiz do
    association :quiz_set
    question { Faker::Lorem.question }
    explanation { Faker::Lorem.sentence }

    after(:create) do |quiz|
      create(:choice, quiz: quiz, correct: true)
      create_list(:choice, 2, quiz: quiz, correct: false)
    end
  end
end