FactoryBot.define do
  factory :quiz do
    quiz_set
    question { "この薬の作用は何ですか？" }
    drug_type { 1 }
    explanation { "正しい回答の説明" }
  end
end