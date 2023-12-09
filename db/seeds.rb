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

quiz_set3 = QuizSet.create!(title: '皮膚薬', description: '皮膚の痒みや炎症を和らげる薬。')

quiz7 = Quiz.create!(quiz_set_id: quiz_set3.id, question: '皮膚のかゆみや炎症を和らげるために使われる薬の主要な成分は何ですか？', explanation: 'コルチコステロイドは、炎症を抑え、かゆみや赤みを軽減するのに効果的な成分です。皮膚炎症や湿疹などの症状を緩和するために医師によって処方されることがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz7.id, text: "ビタミンC", correct: 0},
  {quiz_id: quiz7.id, text: "ヒアルロン酸", correct: 0},
  {quiz_id: quiz7.id, text: "コルチコステロイド", correct: 1}
])
quiz8 = Quiz.create!(quiz_set_id: quiz_set3.id, question: '日焼け後に痛みと赤みを和らげるのに効果的な成分は何ですか？', explanation: 'アロエベラは日焼け後の肌の痛みや赤みを和らげるために使われる自然由来の成分です。その保湿効果と鎮静作用から、日焼け肌の処理に広く使用されています。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz8.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz8.id, text: "アロエベラ", correct: 1},
  {quiz_id: quiz8.id, text: "ヒアルロン酸", correct: 0}
])
quiz9 = Quiz.create!(quiz_set_id: quiz_set3.id, question: '寒冷蕁麻疹（冷たい物に触れると発生する蕁麻疹）を軽減するのに使われる成分は何ですか？', explanation: '寒冷蕁麻疹は冷たい環境にさらされることで発生する蕁麻疹の一種です。アンチヒスタミンは、このようなアレルギー反応を抑制するために使われます。アンチヒスタミンは、ヒスタミンという化学物質の作用をブロックし、かゆみや蕁麻疹の症状を軽減します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz9.id, text: "シアバター", correct: 0},
  {quiz_id: quiz9.id, text: "エピネフリン", correct: 0},
  {quiz_id: quiz9.id, text: "アンチヒスタミン", correct: 1}
])


quiz_set4 = QuizSet.create!(title: '検証用', description: '検証クイズセット')

quiz10 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証1', explanation: '検証解説1', drug_type: 1)
Choice.create!([
  {quiz_id: quiz10.id, text: "回答１", correct: 1},
  {quiz_id: quiz10.id, text: "回答２", correct: 0},
  {quiz_id: quiz10.id, text: "回答３", correct: 0}
])
quiz11 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証2', explanation: '検証解説3', drug_type: 1)
Choice.create!([
  {quiz_id: quiz11.id, text: "回答１", correct: 1},
  {quiz_id: quiz11.id, text: "回答２", correct: 0},
  {quiz_id: quiz11.id, text: "回答３", correct: 0}
])
quiz12 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証3', explanation: '検証解説3', drug_type: 1)
Choice.create!([
  {quiz_id: quiz12.id, text: "回答１", correct: 1},
  {quiz_id: quiz12.id, text: "回答２", correct: 0},
  {quiz_id: quiz12.id, text: "回答３", correct: 0}
])
quiz13 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証4', explanation: '検証解説4', drug_type: 1)
Choice.create!([
  {quiz_id: quiz13.id, text: "回答１", correct: 1},
  {quiz_id: quiz13.id, text: "回答２", correct: 0},
  {quiz_id: quiz13.id, text: "回答３", correct: 0}
])
quiz14 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証5', explanation: '検証解説5', drug_type: 1)
Choice.create!([
  {quiz_id: quiz14.id, text: "回答１", correct: 1},
  {quiz_id: quiz14.id, text: "回答２", correct: 0},
  {quiz_id: quiz14.id, text: "回答３", correct: 0}
])
quiz15 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証6', explanation: '検証解説6', drug_type: 1)
Choice.create!([
  {quiz_id: quiz15.id, text: "回答１", correct: 1},
  {quiz_id: quiz15.id, text: "回答２", correct: 0},
  {quiz_id: quiz15.id, text: "回答３", correct: 0}
])
quiz16 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証7', explanation: '検証解説7', drug_type: 1)
Choice.create!([
  {quiz_id: quiz16.id, text: "回答１", correct: 1},
  {quiz_id: quiz16.id, text: "回答２", correct: 0},
  {quiz_id: quiz16.id, text: "回答３", correct: 0}
])
quiz17 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証8', explanation: '検証解説8', drug_type: 1)
Choice.create!([
  {quiz_id: quiz17.id, text: "回答１", correct: 1},
  {quiz_id: quiz17.id, text: "回答２", correct: 0},
  {quiz_id: quiz17.id, text: "回答３", correct: 0}
])
quiz18 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証9', explanation: '検証解説9', drug_type: 1)
Choice.create!([
  {quiz_id: quiz18.id, text: "回答１", correct: 1},
  {quiz_id: quiz18.id, text: "回答２", correct: 0},
  {quiz_id: quiz18.id, text: "回答３", correct: 0}
])
quiz19 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証10', explanation: '検証解説10', drug_type: 1)
Choice.create!([
  {quiz_id: quiz19.id, text: "回答１", correct: 1},
  {quiz_id: quiz19.id, text: "回答２", correct: 0},
  {quiz_id: quiz19.id, text: "回答３", correct: 0}
])
quiz20 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証11', explanation: '検証解説11', drug_type: 1)
Choice.create!([
  {quiz_id: quiz20.id, text: "回答１", correct: 1},
  {quiz_id: quiz20.id, text: "回答２", correct: 0},
  {quiz_id: quiz20.id, text: "回答３", correct: 0}
])
quiz21 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証12', explanation: '検証解説12', drug_type: 1)
Choice.create!([
  {quiz_id: quiz21.id, text: "回答１", correct: 1},
  {quiz_id: quiz21.id, text: "回答２", correct: 0},
  {quiz_id: quiz21.id, text: "回答３", correct: 0}
])
quiz22 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '検証13', explanation: '検証解説13', drug_type: 1)
Choice.create!([
  {quiz_id: quiz22.id, text: "回答１", correct: 1},
  {quiz_id: quiz22.id, text: "回答２", correct: 0},
  {quiz_id: quiz22.id, text: "回答３", correct: 0}
])