# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.new(name: 'TestUser', email: 'test@example.com', password: 'password')
user.save!

quiz_set1 = QuizSet.create!(title: 'サンプルクイズセット1', description: '説明文1')
quiz_set2 = QuizSet.create!(title: 'サンプルクイズセット2', description: '説明文2')

quiz1 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'サンプルクイズ1', drug_type: 1)
quiz2 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'サンプルクイズ2', drug_type: 1)
quiz3 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'サンプルクイズ3', drug_type: 1)

Choice.create!([
  {quiz_id: quiz1.id, text: "チョイス1", correct: 1},
  {quiz_id: quiz1.id, text: "チョイス2", correct: 0},
  {quiz_id: quiz1.id, text: "チョイス3", correct: 0}
])

Choice.create!([
  {quiz_id: quiz2.id, text: "チョイス1", correct: 1},
  {quiz_id: quiz2.id, text: "チョイス2", correct: 0},
  {quiz_id: quiz2.id, text: "チョイス3", correct: 0}
])

Choice.create!([
  {quiz_id: quiz3.id, text: "チョイス1", correct: 1},
  {quiz_id: quiz3.id, text: "チョイス2", correct: 0},
  {quiz_id: quiz3.id, text: "チョイス3", correct: 0}
])