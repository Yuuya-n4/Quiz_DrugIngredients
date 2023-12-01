FactoryBot.define do
  factory :choice, class: 'Choice' do
    association :quiz
    text { Faker::Lorem.word }
    correct { Faker::Boolean.boolean }
  end
end