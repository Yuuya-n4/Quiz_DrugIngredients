FactoryBot.define do
  factory :quiz_set do
    title { Faker::Educator.course_name }
    description { Faker::Lorem.sentence }

    after(:create) do |quiz_set|
      create_list(:quiz, 10, quiz_set: quiz_set, drug_type: 1)
    end
  end
end