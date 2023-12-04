# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin_user = AdminUser.new(email: 'admin_id', password: 'password')
admin_user.save!

user = User.new(name: 'テストユーザー', email: 'test@example.com', password: 'password')
user.save!

quiz_set1 = QuizSet.create!(title: '風邪薬', description: '解熱や鎮痛、鼻や喉に効く薬')

quiz1 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '風邪薬によく含まれる成分で、鎮痛・解熱作用があるものはどれ？', explanation: '解説1', drug_type: 1)
Choice.create!([
  {quiz_id: quiz1.id, text: "カフェイン", correct: 0},
  {quiz_id: quiz1.id, text: "イブプロフェン", correct: 1},
  {quiz_id: quiz1.id, text: "ビタミンC", correct: 0}
])
quiz2 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '風邪薬に含まれることが多い、咳を鎮める成分はどれ？', explanation: '解説2', drug_type: 1)
Choice.create!([
  {quiz_id: quiz2.id, text: "グアイフェネシン", correct: 1},
  {quiz_id: quiz2.id, text: "ロペラミド", correct: 0},
  {quiz_id: quiz2.id, text: "テオフィリン", correct: 0}
])
quiz3 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '風邪薬に含まれ、鼻づまりを和らげる成分はどれ？', explanation: '解説3', drug_type: 1)
Choice.create!([
  {quiz_id: quiz3.id, text: "デキストロメトルファン", correct: 0},
  {quiz_id: quiz3.id, text: "プソイドエフェドリン", correct: 1},
  {quiz_id: quiz3.id, text: "リゾチーム塩酸塩", correct: 0}
])

quiz_set2 = QuizSet.create!(title: '胃腸薬', description: '胃の保護や下痢止めなどの薬')

quiz4 = Quiz.create!(quiz_set_id: quiz_set2.id, question: '胃酸の過剰分泌を抑える胃腸薬に含まれる成分はどれ？', explanation: '解説4', drug_type: 1)
Choice.create!([
  {quiz_id: quiz4.id, text: "ランソプラゾール", correct: 1},
  {quiz_id: quiz4.id, text: "アスピリン", correct: 0},
  {quiz_id: quiz4.id, text: "メトクロプラミド", correct: 0}
])
quiz5 = Quiz.create!(quiz_set_id: quiz_set2.id, question: '胃腸薬の中で、胃の粘膜を保護する作用がある成分はどれ？', explanation: '解説5', drug_type: 1)
Choice.create!([
  {quiz_id: quiz5.id, text: "ファモチジン", correct: 1},
  {quiz_id: quiz5.id, text: "ラクツロース", correct: 0},
  {quiz_id: quiz5.id, text: "センナ", correct: 0}
])
quiz6 = Quiz.create!(quiz_set_id: quiz_set2.id, question: '下痢を止める効果がある胃腸薬の成分はどれ？', explanation: '解説6', drug_type: 1)
Choice.create!([
  {quiz_id: quiz6.id, text: "ビスマス", correct: 0},
  {quiz_id: quiz6.id, text: "ロペラミド", correct: 1},
  {quiz_id: quiz6.id, text: "リボフラビン", correct: 0}
])
