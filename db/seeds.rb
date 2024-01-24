# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 風邪薬クイズセット

quiz_set1 = QuizSet.create!(title: '風邪薬', description: '発熱、頭痛、喉の痛み、鼻水など様々な風邪の症状を緩和する薬')

quiz1 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '頭痛、発熱、炎症に効果がある解熱鎮痛剤で、胃への影響が少ないとされているのは次のうちどれ？', explanation: 'アセトアミノフェンは胃への影響が少なく、非ステロイド性抗炎症薬に分類されない解熱鎮痛剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz1.id, text: "アセトアミノフェン", correct: 1},
  {quiz_id: quiz1.id, text: "サリチル酸", correct: 0},
  {quiz_id: quiz1.id, text: "カフェイン", correct: 0}
])
quiz2 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '非ステロイド性抗炎症薬に分類され、関節痛や筋肉痛に効果がある成分は？', explanation: 'イブプロフェンは非ステロイド性抗炎症薬の一種で、炎症を抑える効果があり、関節痛や筋肉痛に用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz2.id, text: "イブプロフェン", correct: 1},
  {quiz_id: quiz2.id, text: "リゾチーム塩酸塩", correct: 0},
  {quiz_id: quiz2.id, text: "セチリジン", correct: 0}
])
quiz3 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '頭痛、歯痛、生理痛などに用いられる解熱鎮痛剤で、特に生理痛の緩和に効果的なのは次のうちどれ？', explanation: 'イブプロフェンは非ステロイド性抗炎症薬に分類され、解熱、鎮痛、抗炎症作用を持ち、特に生理痛に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz3.id, text: "イブプロフェン", correct: 1},
  {quiz_id: quiz3.id, text: "パラベン", correct: 0},
  {quiz_id: quiz3.id, text: "グリセリン", correct: 0}
])
quiz4 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、解熱鎮痛剤でありながら、血液をサラサラにする効果も持っています。次のうち、どれでしょう？', explanation: 'アスピリンは解熱、鎮痛効果に加え、血小板の凝集を抑える作用があり、血液をサラサラにする効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz4.id, text: "アスピリン", correct: 1},
  {quiz_id: quiz4.id, text: "リゾチーム塩酸塩", correct: 0},
  {quiz_id: quiz4.id, text: "ビタミンC", correct: 0}
])
quiz5 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '炎症を抑える作用があり、特に歯痛、耳痛、喉の痛みに効果的な成分は？', explanation: 'イブプロフェンは非ステロイド性抗炎症薬で、歯痛、耳痛、喉の痛みなどに効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz5.id, text: "イブプロフェン", correct: 1},
  {quiz_id: quiz5.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz5.id, text: "ニコチン酸アミド", correct: 0}
])
quiz6 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は解熱、鎮痛効果のほか、抗アレルギー作用も持っています。次のうち、どれでしょう？', explanation: 'ジフェンヒドラミンは抗ヒスタミン作用を持ち、アレルギー症状の緩和にも使われます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz6.id, text: "ジフェンヒドラミン", correct: 1},
  {quiz_id: quiz6.id, text: "シクロフェナクナトリウム", correct: 0},
  {quiz_id: quiz6.id, text: "カフェイン", correct: 0}
])
quiz7 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '解熱鎮痛剤の中で、特に発熱時に用いられることが多い成分は？', explanation: 'アセトアミノフェンは、発熱時に特に用いられる解熱鎮痛剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz7.id, text: "アセトアミノフェン", correct: 1},
  {quiz_id: quiz7.id, text: "イブプロフェン", correct: 0},
  {quiz_id: quiz7.id, text: "アスピリン", correct: 0}
])
quiz8 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は解熱鎮痛剤であり、特に発熱や炎症による痛みに効果があるのは次のうちどれ？', explanation: 'アスピリンは発熱や炎症による痛みに効果的な解熱鎮痛剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz8.id, text: "アスピリン", correct: 1},
  {quiz_id: quiz8.id, text: "リゾチーム塩酸塩", correct: 0},
  {quiz_id: quiz8.id, text: "カフェイン", correct: 0}
])
quiz9 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、風邪薬に含まれることがあり、咳を抑える作用があります。次のうち、どれでしょう？', explanation: 'カルボシステインは咳を抑える作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz9.id, text: "カルボシステイン", correct: 1},
  {quiz_id: quiz9.id, text: "ブロムヘキシン", correct: 0},
  {quiz_id: quiz9.id, text: "デキストロメトルファン", correct: 0}
])
quiz10 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '解熱鎮痛剤の中で、特に胃に優しいとされる成分は？', explanation: 'アセトアミノフェンは、胃に優しいとされる解熱鎮痛剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz10.id, text: "アセトアミノフェン", correct: 1},
  {quiz_id: quiz10.id, text: "イブプロフェン", correct: 0},
  {quiz_id: quiz10.id, text: "アスピリン", correct: 0}
])
quiz11 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は抗ヒスタミン薬として知られ、風邪薬の中でも特に鼻水やくしゃみに効果的です。次のうち、どれでしょう？', explanation: 'クロルフェニラミンマレイン酸塩は抗ヒスタミン薬で、風邪による鼻水やくしゃみの症状緩和に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz11.id, text: "クロルフェニラミンマレイン酸塩", correct: 1},
  {quiz_id: quiz11.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz11.id, text: "カフェイン", correct: 0}
])
quiz12 = Quiz.create!(quiz_set_id: quiz_set1.id, question: ' 風邪薬に用いられるこの成分は、気道を広げる作用があり、咳や喘息の症状を緩和するのに効果的です。次のうち、どれでしょう？', explanation: 'エフェドリンは気道を広げる作用があり、咳や喘息の症状緩和に用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz12.id, text: "エフェドリン", correct: 1},
  {quiz_id: quiz12.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz12.id, text: "ロキソニン", correct: 0}
])
quiz13 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は解熱鎮痛剤であり、発熱や痛みを和らげるのに効果的ですが、長期使用には注意が必要です。次のうち、どれでしょう？', explanation: 'アスピリンは解熱、鎮痛効果がありますが、長期使用による副作用に注意が必要です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz13.id, text: "アスピリン", correct: 1},
  {quiz_id: quiz13.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz13.id, text: "エフェドリン", correct: 0}
])
quiz14 = Quiz.create!(quiz_set_id: quiz_set1.id, question: '風邪薬に用いられるこの成分は、気道を拡張し、咳を和らげる効果があります。次のうち、どれでしょう？', explanation: 'デキストロメトルファンは気道を拡張し、咳を和らげる効果がある成分です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz14.id, text: "デキストロメトルファン", correct: 1},
  {quiz_id: quiz14.id, text: "カフェイン", correct: 0},
  {quiz_id: quiz14.id, text: "ジフェンヒドラミン", correct: 0}
])
quiz15 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、風邪薬の中で鎮静作用を持ち、睡眠を促進するのに用いられることがあります。次のうち、どれでしょう？', explanation: 'ジフェンヒドラミンは鎮静作用を持ち、睡眠を促進する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz15.id, text: "ジフェンヒドラミン", correct: 1},
  {quiz_id: quiz15.id, text: "デキストロメトルファン", correct: 0},
  {quiz_id: quiz15.id, text: "カフェイン", correct: 0}
])
quiz16 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、咳を抑える作用があり、風邪薬の中でも特に咳止めに用いられます。次のうち、どれでしょう？', explanation: 'ノスカピンは咳止めの成分として知られ、咳を抑える効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz16.id, text: "ノスカピン", correct: 1},
  {quiz_id: quiz16.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz16.id, text: "デキストロメトルファン", correct: 0}
])
quiz17 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、抗アレルギー作用があり、風邪薬の中でも鼻水やくしゃみの症状緩和に効果的です。次のうち、どれでしょう？', explanation: 'メキタジンは抗アレルギー薬で、鼻水やくしゃみなどの症状緩和に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz17.id, text: "メキタジン", correct: 1},
  {quiz_id: quiz17.id, text: "エフェドリン", correct: 0},
  {quiz_id: quiz17.id, text: "クロルフェニラミンマレイン酸塩", correct: 0}
])
quiz18 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、解熱鎮痛剤でありながら、血液をサラサラにする効果も持っています。次のうち、どれでしょう？', explanation: 'サリチル酸は解熱、鎮痛効果に加え、血小板の凝集を抑える作用があり、血液をサラサラにする効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz18.id, text: "サリチル酸", correct: 1},
  {quiz_id: quiz18.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz18.id, text: "イブプロフェン", correct: 0}
])
quiz19 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、解熱鎮痛剤であり、発熱や頭痛に効果があります。また、抗血小板作用も持っているのは次のうちどれ？', explanation: 'サリチル酸は解熱鎮痛剤であり、抗血小板作用も持っているため、発熱や頭痛に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz19.id, text: "サリチル酸", correct: 1},
  {quiz_id: quiz19.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz19.id, text: "シクロフェナクナトリウム", correct: 0}
])
quiz20 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、風邪薬に含まれ、鼻づまりを和らげる効果があります。次のうち、どれでしょう？', explanation: 'プソイドエフェドリン塩酸塩は、鼻づまりを和らげる作用があり、風邪薬に含まれることがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz20.id, text: "プソイドエフェドリン塩酸塩", correct: 1},
  {quiz_id: quiz20.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz20.id, text: "シクロフェナクナトリウム", correct: 0}
])
quiz21 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、風邪薬に含まれ、喉の痛みや口内の炎症を和らげる効果があります。次のうち、どれでしょう？', explanation: 'リゾチーム塩酸塩は、喉の痛みや口内の炎症を和らげる効果があり、風邪薬に含まれることがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz21.id, text: "リゾチーム塩酸塩", correct: 1},
  {quiz_id: quiz21.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz21.id, text: "メキタジン", correct: 0}
])
quiz22 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は解熱鎮痛剤であり、特に頭痛に効果があるとされています。次のうち、どれでしょう？', explanation: 'ケトプロフェンは非ステロイド性抗炎症薬の一種で、特に頭痛に効果があるとされています。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz22.id, text: "ケトプロフェン", correct: 1},
  {quiz_id: quiz22.id, text: "ジフェンヒドラミン", correct: 0},
  {quiz_id: quiz22.id, text: "パラセタモール", correct: 0}
])
quiz23 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、抗アレルギー作用を持ち、特に風邪薬の中で眠気を引き起こすことが少ないとされる抗ヒスタミン薬です。次のうち、どれでしょう？', explanation: 'フェキソフェナジンは抗アレルギー作用を持つ抗ヒスタミン薬で、眠気を引き起こすことが少ないとされています。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz23.id, text: "フェキソフェナジン", correct: 1},
  {quiz_id: quiz23.id, text: "ノスカピン", correct: 0},
  {quiz_id: quiz23.id, text: "リゾチーム塩酸塩", correct: 0}
])
quiz24 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、非ステロイド性抗炎症薬の一種で、筋肉痛や関節痛に効果的です。次のうち、どれでしょう？', explanation: 'シクロフェナクナトリウムは非ステロイド性抗炎症薬の一種で、筋肉痛や関節痛に効果的です', drug_type: 1)
Choice.create!([
  {quiz_id: quiz24.id, text: "シクロフェナクナトリウム", correct: 1},
  {quiz_id: quiz24.id, text: "ケトプロフェン", correct: 0},
  {quiz_id: quiz24.id, text: "パラセタモール", correct: 0}
])
quiz25 = Quiz.create!(quiz_set_id: quiz_set1.id, question: 'この成分は、風邪薬に含まれることがあり、気道を拡張して咳を和らげる効果があります。次のうち、どれでしょう？', explanation: 'ノスカピンは気道を拡張して咳を和らげる効果がある成分です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz25.id, text: "ノスカピン", correct: 1},
  {quiz_id: quiz25.id, text: "デキストロメトルファン", correct: 0},
  {quiz_id: quiz25.id, text: "エフェドリン", correct: 0}
])





# 胃腸薬クイズセット

quiz_set2 = QuizSet.create!(title: '胃腸薬', description: '胃や腸の不快感を和らげたり調子を整える薬')

quiz26 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸の過剰分泌を抑えることで胃の痛みや胃もたれを緩和します。胃炎や胃潰瘍の治療にも用いられることがあります。', explanation: 'ファモチジンはH2ブロッカーの一種で、胃酸の分泌を抑える効果があります。胃炎や胃潰瘍の治療にも用いられることがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz26.id, text: "ファモチジン", correct: 1},
  {quiz_id: quiz26.id, text: "センノシド", correct: 0},
  {quiz_id: quiz26.id, text: "カフェイン", correct: 0}
])
quiz27 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、消化不良や食欲不振時に用いられることが多い消化促進薬です。', explanation: 'ビオヂアスターゼは、消化酵素の一種であり、消化不良や食欲不振時に消化を助けるために使用されます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz27.id, text: "ビオヂアスターゼ", correct: 1},
  {quiz_id: quiz27.id, text: "ウルソデオキシコール酸", correct: 0},
  {quiz_id: quiz27.id, text: "イブプロフェン", correct: 0}
])
quiz28 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、下痢を止める作用があり、下痢止め薬に多く用いられています。', explanation: 'ロペラミドは下痢止め薬の主成分で、腸の運動を鈍化させることで下痢を止める効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz28.id, text: "ロペラミド", correct: 1},
  {quiz_id: quiz28.id, text: "アスコルビン酸", correct: 0},
  {quiz_id: quiz28.id, text: "グリチルリチン", correct: 0}
])
quiz29 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸の中和作用を持ち、胃もたれや胃痛の緩和に用いられます。', explanation: 'アルミニウム水酸化物は、胃酸を中和することで胃の粘膜を保護し、胃もたれや胃痛を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz29.id, text: "アルミニウム水酸化物", correct: 1},
  {quiz_id: quiz29.id, text: "アセトアミノフェン", correct: 0},
  {quiz_id: quiz29.id, text: "グリセリン", correct: 0}
])
quiz30 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃の粘膜を保護し、胃潰瘍の治療にも用いられることがあります。', explanation: 'シメチコンは、胃の粘膜を覆い保護する作用があり、胃潰瘍の治療にも使用されることがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz30.id, text: "シメチコン", correct: 1},
  {quiz_id: quiz30.id, text: "リン酸水素カルシウム", correct: 0},
  {quiz_id: quiz30.id, text: "センノシド", correct: 0}
])
quiz31 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、便秘薬に用いられ、腸内の水分を増やして便を軟らかくする効果があります。', explanation: 'センナは、腸内の水分を増やし便を軟らかくすることで、便秘を解消する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz31.id, text: "センナ", correct: 1},
  {quiz_id: quiz31.id, text: "マグネシウム炭酸", correct: 0},
  {quiz_id: quiz31.id, text: "グリチルリチン", correct: 0}
])
quiz32 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸過多による胸やけや胃もたれに効果的で、制酸薬に含まれています。', explanation: 'マグネシウム酸化物は、胃酸を中和して胸やけや胃もたれを緩和する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz32.id, text: "マグネシウム酸化物", correct: 1},
  {quiz_id: quiz32.id, text: "パラセタモール", correct: 0},
  {quiz_id: quiz32.id, text: "ビタミンC", correct: 0}
])
quiz33 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、腸内での水分吸収を抑え、便を軟らかくすることで便秘を改善します。', explanation: 'ポリエチレングリコールは、腸内での水分吸収を抑制し、便を軟らかくして便秘を改善する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz33.id, text: "ポリエチレングリコール", correct: 1},
  {quiz_id: quiz33.id, text: "センナ", correct: 0},
  {quiz_id: quiz33.id, text: "マグネシウム炭酸", correct: 0}
])
quiz34 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃の過剰なガスを除去し、胃腸の不快感や膨満感を和らげるために用いられます。', explanation: 'シメチコンは、胃内のガスを減少させることで、胃腸の不快感や膨満感を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz34.id, text: "シメチコン", correct: 1},
  {quiz_id: quiz34.id, text: "ファモチジン", correct: 0},
  {quiz_id: quiz34.id, text: "ロペラミド", correct: 0}
])
quiz35 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃の粘膜を修復し、胃潰瘍や十二指腸潰瘍の治療に用いられます。', explanation: 'ウルソデオキシコール酸は、胃の粘膜を修復する効果があり、胃潰瘍や十二指腸潰瘍の治療に使用されます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz35.id, text: "ウルソデオキシコール酸", correct: 1},
  {quiz_id: quiz35.id, text: "リボフラビン", correct: 0},
  {quiz_id: quiz35.id, text: "センナ", correct: 0}
])
quiz36 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、炭酸ガスを発生させることで胃を拡張し、消化を助ける効果があります。', explanation: 'ナトリウム水素炭酸は、胃内で炭酸ガスを発生させることで胃を拡張し、消化を助ける作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz36.id, text: "ナトリウム水素炭酸", correct: 1},
  {quiz_id: quiz36.id, text: "マグネシウム酸化物", correct: 0},
  {quiz_id: quiz36.id, text: "アスコルビン酸", correct: 0}
])
quiz37 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、腸内の水分を増やすことで便を柔らかくし、便秘を解消します。', explanation: 'ポリエチレングリコールは、腸内の水分を増やすことで便を柔らかくし、便秘の改善に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz37.id, text: "ポリエチレングリコール", correct: 1},
  {quiz_id: quiz37.id, text: "センナ", correct: 0},
  {quiz_id: quiz37.id, text: "アスコルビン酸", correct: 0}
])
quiz38 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸の分泌を抑えることで、胃炎や胃潰瘍の治療に用いられます。', explanation: 'ファモチジンはH2ブロッカーの一種で、胃酸の分泌を抑えることにより胃炎や胃潰瘍の治療に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz38.id, text: "ファモチジン", correct: 1},
  {quiz_id: quiz38.id, text: "シメチコン", correct: 0},
  {quiz_id: quiz38.id, text: "マグネシウム炭酸", correct: 0}
])
quiz39 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、下痢を抑える効果があり、特に急性の下痢症状の治療に用いられます。', explanation: 'ロペラミドは、腸の動きを鈍化させることで下痢を抑える効果があり、特に急性の下痢症状に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz39.id, text: "ロペラミド", correct: 1},
  {quiz_id: quiz39.id, text: "グリチルリチン", correct: 0},
  {quiz_id: quiz39.id, text: "ビタミンB1", correct: 0}
])
quiz40 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸と反応して中和作用を発揮し、胃もたれや胃痛を緩和します。', explanation: 'マグネシウム酸化物は、胃酸と反応して中和作用を発揮し、胃もたれや胃痛を緩和する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz40.id, text: "マグネシウム酸化物", correct: 1},
  {quiz_id: quiz40.id, text: "リボフラビン", correct: 0},
  {quiz_id: quiz40.id, text: "カフェイン", correct: 0}
])
quiz41 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、消化管の運動を促進し、便秘の治療に用いられます。', explanation: 'ピコスルファートナトリウムは、消化管の運動を促進することにより、便秘の治療に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz41.id, text: "ピコスルファートナトリウム", correct: 1},
  {quiz_id: quiz41.id, text: "グリチルリチン", correct: 0},
  {quiz_id: quiz41.id, text: "ビタミンC", correct: 0}
])
quiz42 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃腸内の過剰なガスを除去し、膨満感やガスによる不快感を和らげます。', explanation: 'ジメチコンは、胃腸内の過剰なガスを除去し、膨満感やガスによる不快感を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz42.id, text: "ジメチコン", correct: 1},
  {quiz_id: quiz42.id, text: "カルボシステイン", correct: 0},
  {quiz_id: quiz42.id, text: "ジメチコン", correct: 0}
])
quiz43 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃腸の粘膜を保護し、胃もたれや胸やけの緩和に用いられます。', explanation: 'アルジオキサは、胃腸の粘膜を保護することで、胃もたれや胸やけを和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz43.id, text: "アルジオキサ", correct: 1},
  {quiz_id: quiz43.id, text: "アスピリン", correct: 0},
  {quiz_id: quiz43.id, text: "リン酸水素カルシウム", correct: 0}
])
quiz44 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、消化管の平滑筋をリラックスさせ、胃痛や腹痛の緩和に用いられます。', explanation: 'スコポラミンブチルブロマイドは、消化管の平滑筋をリラックスさせることで、胃痛や腹痛を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz44.id, text: "スコポラミンブチルブロマイド", correct: 1},
  {quiz_id: quiz44.id, text: "シメチコン", correct: 0},
  {quiz_id: quiz44.id, text: "ビタミンB6", correct: 0}
])
quiz45 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、下痢を抑制し、腸内の水分吸収を増やすことで下痢を改善します。', explanation: 'タンニン酸アルブミンは、腸内の水分吸収を増やすことで下痢を抑制し、改善する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz45.id, text: "タンニン酸アルブミン", correct: 1},
  {quiz_id: quiz45.id, text: "センナ", correct: 0},
  {quiz_id: quiz45.id, text: "ロペラミド", correct: 0}
])
quiz46 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、腸内細菌の活動を改善し、便秘や腸内環境の整備に効果があります。', explanation: 'ラクツロースは、腸内細菌の活動を改善し、便秘の改善や腸内環境の整備に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz46.id, text: "ラクツロース", correct: 1},
  {quiz_id: quiz46.id, text: "センナ", correct: 0},
  {quiz_id: quiz46.id, text: "ビフィズス菌", correct: 0}
])
quiz47 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃粘膜の修復と保護を助け、胃炎や胃潰瘍の治療に役立ちます。', explanation: 'スクラルファートは、胃粘膜の修復と保護を助け、胃炎や胃潰瘍の治療に用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz47.id, text: "スクラルファート", correct: 1},
  {quiz_id: quiz47.id, text: "リファンピシン", correct: 0},
  {quiz_id: quiz47.id, text: "セファゾリン", correct: 0}
])
quiz48 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃液の分泌を抑えることで胃潰瘍の治療に用いられ、長期的な効果が期待できます。', explanation: 'ランソプラゾールはプロトンポンプ阻害剤の一種で、胃液の分泌を抑えることにより胃潰瘍の治療に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz48.id, text: "ランソプラゾール", correct: 1},
  {quiz_id: quiz48.id, text: "セファゾリン", correct: 0},
  {quiz_id: quiz48.id, text: "シメチコン", correct: 0}
])
quiz49 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、強力な下剤であり、腸の運動を刺激して便秘を治療します。', explanation: 'ヒマシ油は、強力な下剤で、腸の運動を刺激することで便秘を治療します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz49.id, text: "ヒマシ油", correct: 1},
  {quiz_id: quiz49.id, text: "ラクツロース", correct: 0},
  {quiz_id: quiz49.id, text: "ポリエチレングリコール", correct: 0}
])
quiz50 = Quiz.create!(quiz_set_id: quiz_set2.id, question: 'この成分は、胃酸と反応して胃の粘膜を保護し、胃炎や胃潰瘍の治療に役立つことが知られています。', explanation: '没食子酸ビスマスは、胃酸と反応することで胃の粘膜を保護し、胃炎や胃潰瘍の治療に有効です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz50.id, text: "没食子酸ビスマス", correct: 1},
  {quiz_id: quiz50.id, text: "レバミピド", correct: 0},
  {quiz_id: quiz50.id, text: "ソジウム炭酸水素塩", correct: 0}
])




# 皮膚薬クイズセット

quiz_set3 = QuizSet.create!(title: '皮膚薬', description: '皮膚の炎症や湿疹やかゆみなどを抑える薬')

quiz51 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は抗炎症作用を持ち、湿疹や皮膚炎に効果的です。どれがこの成分ですか？', explanation: 'ヒドロコルチゾンはステロイド系の抗炎症剤で、皮膚の炎症を鎮める効果があります。ベンゾカインは局所麻酔剤、アスピリンは解熱鎮痛剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz51.id, text: "ヒドロコルチゾン", correct: 1},
  {quiz_id: quiz51.id, text: "ベンゾカイン", correct: 0},
  {quiz_id: quiz51.id, text: "アスピリン", correct: 0}
])
quiz52 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は皮膚の水虫治療に用いられます。どれがこの成分ですか？', explanation: 'クロトリマゾールは抗真菌剤で、水虫やカンジダ症の治療に効果があります。サリチル酸は角質軟化作用があり、グリチルリチン酸は抗炎症作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz52.id, text: "クロトリマゾール", correct: 1},
  {quiz_id: quiz52.id, text: "サリチル酸", correct: 0},
  {quiz_id: quiz52.id, text: "グリチルリチン酸", correct: 0}
])
quiz53 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は虫刺されのかゆみを鎮める効果があります。どれがこの成分ですか？', explanation: 'メンソールは清涼感を与え、かゆみを鎮める効果があります。カンフルも同様の効果がありますが、メンソールの方がより一般的です。イソプロピルメチルフェノールは抗菌作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz53.id, text: "メンソール", correct: 1},
  {quiz_id: quiz53.id, text: "カンフル", correct: 0},
  {quiz_id: quiz53.id, text: "イソプロピルメチルフェノール", correct: 0}
])
quiz54 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は肌の乾燥を防ぎ、保湿効果があります。どれがこの成分ですか？', explanation: 'ワセリンは肌の水分蒸発を防ぎ、保湿効果を発揮します。セタノールは乳化剤や増粘剤として使われ、パラベンは防腐剤として使われます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz54.id, text: "ワセリン", correct: 1},
  {quiz_id: quiz54.id, text: "セタノール", correct: 0},
  {quiz_id: quiz54.id, text: "パラベン", correct: 0}
])
quiz55 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、角質を柔らかくし、老廃物の除去に効果的です。どれがこの成分ですか？', explanation: 'サリチル酸は角質軟化作用があり、古い角質の除去に役立ちます。ベンゾイルペルオキシドはニキビ治療、グリチルリチン酸は抗炎症作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz55.id, text: "サリチル酸", correct: 1},
  {quiz_id: quiz55.id, text: "ベンゾイルペルオキシド", correct: 0},
  {quiz_id: quiz55.id, text: "グリチルリチン酸", correct: 0}
])
quiz56 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、抗真菌作用を持ち、たむし治療に用いられます。どれがこの成分ですか？', explanation: 'ミコナゾールは広範囲の真菌に効果があり、たむし治療によく用いられます。カンフルとメンソールは清涼感を与え、かゆみを鎮める効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz56.id, text: "ミコナゾール", correct: 1},
  {quiz_id: quiz56.id, text: "カンフル", correct: 0},
  {quiz_id: quiz56.id, text: "メンソール", correct: 0}
])
quiz57 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、抗菌作用があり、化膿性の皮膚病に用いられます。どれがこの成分ですか？', explanation: 'イソプロピルメチルフェノールは、広範囲の細菌に対する抗菌作用があり、化膿性の皮膚病に効果的です。ベンゾイルペルオキシドはニキビ治療、グリチルリチン酸は抗炎症作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz57.id, text: "イソプロピルメチルフェノール", correct: 1},
  {quiz_id: quiz57.id, text: "ベンゾイルペルオキシド", correct: 0},
  {quiz_id: quiz57.id, text: "グリチルリチン酸", correct: 0}
])
quiz58 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚のかゆみや炎症を鎮めるために用いられます。どれがこの成分ですか？', explanation: 'ヒドロコルチゾンは弱いステロイドで、かゆみや炎症を効果的に鎮めることができます。カンフルは清涼感を与える成分、グリチルリチン酸は抗炎症作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz58.id, text: "ヒドロコルチゾン", correct: 1},
  {quiz_id: quiz58.id, text: "ヒドロコルチゾン", correct: 0},
  {quiz_id: quiz58.id, text: "グリチルリチン酸", correct: 0}
])
quiz59 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、肌を柔らかくし、乾燥を防ぐために用いられます。どれがこの成分ですか？', explanation: 'グリセリンは保湿剤として広く使用されており、肌を柔らかくし乾燥を防ぐ効果があります。ワセリンも保湿効果がありますが、グリセリンはより肌になじみやすいです。セタノールは乳化剤や増粘剤です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz59.id, text: "グリセリン", correct: 1},
  {quiz_id: quiz59.id, text: "ワセリン", correct: 0},
  {quiz_id: quiz59.id, text: "セタノール", correct: 0}
])
quiz60 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、抗炎症作用と抗菌作用を持ち、皮膚の軽度の感染症に用いられます。どれがこの成分ですか？', explanation: 'フラジオマイシン硫酸塩は、広範囲の細菌に対する抗菌作用と抗炎症作用があり、軽度の皮膚感染症に効果的です。クロトリマゾールは抗真菌剤、サリチル酸は角質軟化作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz60.id, text: "フラジオマイシン硫酸塩", correct: 1},
  {quiz_id: quiz60.id, text: "クロトリマゾール", correct: 0},
  {quiz_id: quiz60.id, text: "サリチル酸", correct: 0}
])
quiz61 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚の損傷を修復し、肌荒れやかぶれに用いられます。どれがこの成分ですか？', explanation: 'アラントインは皮膚の修復を促進し、肌荒れやかぶれに効果があります。グリセリンは保湿剤、ヒアルロン酸は水分保持能力を高めます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz61.id, text: "アラントイン", correct: 1},
  {quiz_id: quiz61.id, text: "グリセリン", correct: 0},
  {quiz_id: quiz61.id, text: "ヒアルロン酸", correct: 0}
])
quiz62 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚のかゆみを鎮めるために用いられ、清涼感を与えます。どれがこの成分ですか？', explanation: 'カンフルは清涼感を与え、皮膚のかゆみを鎮める効果があります。メンソールも同様の効果がありますが、カンフルはより刺激が強いです。サリチル酸は角質軟化作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz62.id, text: "カンフル", correct: 1},
  {quiz_id: quiz62.id, text: "メンソール", correct: 0},
  {quiz_id: quiz62.id, text: "サリチル酸", correct: 0}
])
quiz63 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、水虫治療に用いられる抗真菌剤です。どれがこの成分ですか？', explanation: 'テルビナフィンは広範囲の真菌に効果があり、特に水虫治療に効果的です。ミコナゾールとクロトリマゾールも抗真菌剤ですが、テルビナフィンは特にたむし類に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz63.id, text: "テルビナフィン", correct: 1},
  {quiz_id: quiz63.id, text: "ミコナゾール", correct: 0},
  {quiz_id: quiz63.id, text: "クロトリマゾール", correct: 0}
])
quiz64 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、強い殺菌作用を持ち、皮膚の細菌感染症に用いられます。どれがこの成分ですか？', explanation: 'クロルヘキシジングルコン酸塩は、広範囲の細菌に対して強い殺菌作用を持ち、皮膚の細菌感染症に効果的です。イソプロピルメチルフェノールとフラジオマイシン硫酸塩も抗菌作用がありますが、クロルヘキシジンは特に強い殺菌力が特徴です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz64.id, text: "クロルヘキシジングルコン酸塩", correct: 1},
  {quiz_id: quiz64.id, text: "イソプロピルメチルフェノール", correct: 0},
  {quiz_id: quiz64.id, text: "イソプロピルメチルフェノール", correct: 0}
])
quiz65 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、かゆみを鎮めるために用いられ、アレルギー性の皮膚炎に効果的です。どれがこの成分ですか？', explanation: 'グリチルリチン酸は抗炎症作用があり、特にアレルギー性の皮膚炎に効果的です。ヒドロコルチゾンは弱いステロイド剤、カンフルは清涼感を与える成分です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz65.id, text: "グリチルリチン酸", correct: 1},
  {quiz_id: quiz65.id, text: "ヒドロコルチゾン", correct: 0},
  {quiz_id: quiz65.id, text: "カンフル", correct: 0}
])
quiz66 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚のかゆみを鎮める効果があり、特に虫刺されに用いられます。どれがこの成分ですか？', explanation: 'リドカインは局所麻酔作用があり、虫刺されによるかゆみを鎮めるのに効果的です。カンフルとメンソールもかゆみを鎮める成分ですが、リドカインはより強力な麻酔効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz66.id, text: "リドカイン", correct: 1},
  {quiz_id: quiz66.id, text: "カンフル", correct: 0},
  {quiz_id: quiz66.id, text: "メンソール", correct: 0}
])
quiz67 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、水虫治療に用いられ、真菌の細胞膜を破壊する作用があります。どれがこの成分ですか？', explanation: 'クロトリマゾールは真菌の細胞膜を破壊することで、水虫などの真菌感染症に効果的です。ミコナゾールとテルビナフィンも抗真菌剤ですが、クロトリマゾールは特に水虫治療によく用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz67.id, text: "クロトリマゾール", correct: 1},
  {quiz_id: quiz67.id, text: "ミコナゾール", correct: 0},
  {quiz_id: quiz67.id, text: "テルビナフィン", correct: 0}
])
quiz68 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、抗炎症作用があり、特に日焼けによる皮膚の赤みや炎症を鎮めるのに用いられます。どれがこの成分ですか？', explanation: 'デキサメタゾンは強力なステロイド剤で、特に日焼けによる皮膚の赤みや炎症を効果的に鎮めることができます。グリチルリチン酸とアラントインも抗炎症作用がありますが、デキサメタゾンはより強力です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz68.id, text: "デキサメタゾン", correct: 1},
  {quiz_id: quiz68.id, text: "グリチルリチン酸", correct: 0},
  {quiz_id: quiz68.id, text: "アラントイン", correct: 0}
])
quiz69 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚のかゆみやアレルギー反応を鎮める効果があります。どれがこの成分ですか？', explanation: 'ジフェンヒドラミンは抗ヒスタミン作用があり、皮膚のかゆみやアレルギー反応を効果的に鎮めます。グリチルリチン酸とデキサメタゾンも抗炎症作用がありますが、ジフェンヒドラミンは特にかゆみに対する鎮静効果が強いです。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz69.id, text: "ジフェンヒドラミン", correct: 1},
  {quiz_id: quiz69.id, text: "グリチルリチン酸", correct: 0},
  {quiz_id: quiz69.id, text: "デキサメタゾン", correct: 0}
])
quiz70 = Quiz.create!(quiz_set_id: quiz_set3.id, question: 'この成分は、皮膚の細菌感染症に対して広範囲の抗菌作用を持ちます。どれがこの成分ですか？', explanation: 'イソプロピルメチルフェノールは、広範囲の細菌に対して効果があり、皮膚の細菌感染症に効果的です。クロルヘキシジングルコン酸塩とフラジオマイシン硫酸塩も抗菌作用がありますが、イソプロピルメチルフェノールは特に皮膚感染症に広く用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz70.id, text: "イソプロピルメチルフェノール", correct: 1},
  {quiz_id: quiz70.id, text: "クロルヘキシジングルコン酸塩", correct: 0},
  {quiz_id: quiz70.id, text: "フラジオマイシン硫酸塩", correct: 0}
])






# 目、鼻、口クイズセット

quiz_set4 = QuizSet.create!(title: '目、鼻、口', description: '目、鼻、口の症状を抑える薬やアレルギー薬')

quiz71 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '目の炎症やアレルギーに効果的な成分は？', explanation: 'クロルフェニラミンマレイン酸塩は、アレルギー性疾患に対する抗ヒスタミン薬として用いられ、目の炎症やかゆみに効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz71.id, text: "クロルフェニラミンマレイン酸塩", correct: 1},
  {quiz_id: quiz71.id, text: "ポビドンヨード", correct: 0},
  {quiz_id: quiz71.id, text: "ビタミンB1", correct: 0}
])
quiz72 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '口内炎やのどの炎症に効果的な成分は？', explanation: 'グリチルリチン酸は、抗炎症作用を持ち、口内炎やのどの炎症治療に用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz72.id, text: "グリチルリチン酸", correct: 1},
  {quiz_id: quiz72.id, text: "アセチルサリチル酸", correct: 0},
  {quiz_id: quiz72.id, text: "ビタミンB6", correct: 0}
])
quiz73 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '鼻のかぜ治療に使われる抗ヒスタミン薬は？', explanation: 'ジフェンヒドラミン塩酸塩は、抗ヒスタミン薬として鼻のかぜ治療に用いられ、くしゃみや鼻水を抑える効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz73.id, text: "ジフェンヒドラミン塩酸塩", correct: 1},
  {quiz_id: quiz73.id, text: "リン酸コデイン", correct: 0},
  {quiz_id: quiz73.id, text: "ベンフォチアミン", correct: 0}
])
quiz74 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '目の充血を和らげる成分は？', explanation: 'テトラヒドロゾリンは、血管収縮作用により目の充血を和らげる成分です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz74.id, text: "テトラヒドロゾリン", correct: 1},
  {quiz_id: quiz74.id, text: "カルボシステイン", correct: 0},
  {quiz_id: quiz74.id, text: "ビタミンC", correct: 0}
])
quiz75 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '乾燥した目を潤すのに用いられる成分は？', explanation: 'ヒアルロン酸ナトリウムは、高い保水力を持ち、目の乾燥を和らげるために用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz75.id, text: "ヒアルロン酸ナトリウム", correct: 1},
  {quiz_id: quiz75.id, text: "ポビドンヨード", correct: 0},
  {quiz_id: quiz75.id, text: "グルコサミン", correct: 0}
])
quiz76 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '花粉症による鼻水やくしゃみに効果的な成分は？', explanation: 'フェキソフェナジンは、花粉症に伴う鼻水やくしゃみを和らげる抗アレルギー薬です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz76.id, text: "フェキソフェナジン", correct: 1},
  {quiz_id: quiz76.id, text: "リン酸コデイン", correct: 0},
  {quiz_id: quiz76.id, text: "ニコチン酸アミド", correct: 0}
])
quiz77 = Quiz.create!(quiz_set_id: quiz_set4.id, question: 'のどの痛みや腫れに用いられる消炎剤は？', explanation: 'リゾチーム塩酸塩は、抗菌作用と消炎作用を持ち、のどの痛みや腫れに効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz77.id, text: "リゾチーム塩酸塩", correct: 1},
  {quiz_id: quiz77.id, text: "ビタミンC", correct: 0},
  {quiz_id: quiz77.id, text: "フラボノイド", correct: 0}
])
quiz78 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '目の乾きや疲れに効果的なビタミン成分は？', explanation: 'ビタミンAは、目の乾きや疲れに効果的で、視力の維持にも重要なビタミンです。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz78.id, text: "ビタミンA", correct: 1},
  {quiz_id: quiz78.id, text: "ピレノキシン", correct: 0},
  {quiz_id: quiz78.id, text: "ニコチン酸アミド", correct: 0}
])
quiz79 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '鼻腔内の粘膜を保護する成分は？', explanation: 'カルボシステインは、鼻腔内の粘膜を保護し、粘液の粘度を下げる作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz79.id, text: "カルボシステイン", correct: 1},
  {quiz_id: quiz79.id, text: "テトラヒドロゾリン", correct: 0},
  {quiz_id: quiz79.id, text: "グリチルリチン酸", correct: 0}
])
quiz80 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '目の疲れやかすみに用いられるビタミン成分は？', explanation: 'ビタミンB2は、目の疲れやかすみに効果があり、眼精疲労の改善に役立ちます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz80.id, text: "ビタミンB2", correct: 1},
  {quiz_id: quiz80.id, text: "ビタミンB12", correct: 0},
  {quiz_id: quiz80.id, text: "ビタミンC", correct: 0}
])
quiz81 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '目のかゆみを抑える成分は？', explanation: 'ナファゾリンは、血管収縮作用により目のかゆみを抑える成分です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz81.id, text: "ナファゾリン", correct: 1},
  {quiz_id: quiz81.id, text: "ビタミンB12", correct: 0},
  {quiz_id: quiz81.id, text: "カフェイン", correct: 0}
])
quiz82 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '眼精疲労に効果的なビタミン成分は？', explanation: 'ビタミンEは、眼精疲労に効果があり、目の健康維持に寄与します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz82.id, text: "ビタミンE", correct: 1},
  {quiz_id: quiz82.id, text: "ビタミンB12", correct: 0},
  {quiz_id: quiz82.id, text: "ビタミンC", correct: 0}
])
quiz83 = Quiz.create!(quiz_set_id: quiz_set4.id, question: 'アレルギー性鼻炎の予防と治療に用いられる成分は？', explanation: 'クロモグリク酸ナトリウムは、アレルギー性鼻炎の予防と治療に用いられ、炎症反応を抑制する効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz83.id, text: "クロモグリク酸ナトリウム", correct: 1},
  {quiz_id: quiz83.id, text: "ケトチフェン", correct: 0},
  {quiz_id: quiz83.id, text: "フェキソフェナジン", correct: 0}
])
quiz84 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '皮膚の修復を促進し、傷や炎症に効果的な成分は？', explanation: 'アラントインは、皮膚の修復を促進し、傷や炎症に効果的な成分で、肌の再生を助ける働きがあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz84.id, text: "アラントイン", correct: 1},
  {quiz_id: quiz84.id, text: "イブプロフェン", correct: 0},
  {quiz_id: quiz84.id, text: "グリチルリチン酸", correct: 0}
])
quiz85 = Quiz.create!(quiz_set_id: quiz_set4.id, question: '歯肉炎や口内炎の治療に用いられる抗菌・鎮痛成分は？', explanation: '木クレオソートは、抗菌作用と鎮痛作用を持ち、歯肉炎や口内炎の治療に効果的です。また、口臭の原因となる細菌の増殖を抑制する効果もあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz85.id, text: "木クレオソート", correct: 1},
  {quiz_id: quiz85.id, text: "アラントイン", correct: 0},
  {quiz_id: quiz85.id, text: "リドカイン", correct: 0}
])






# 滋養強壮クイズセット

quiz_set5 = QuizSet.create!(title: '滋養強壮', description: '不調や体質の改善、特定の栄養素不足の改善など')

quiz86 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、抗酸化作用があり、滋養強壮にも用いられるビタミンはどれですか？', explanation: 'ビタミンEは抗酸化作用が高く、細胞の老化防止や免疫力向上に寄与し、滋養強壮にも効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz86.id, text: "ビタミンE", correct: 1},
  {quiz_id: quiz86.id, text: "ビタミンC", correct: 0},
  {quiz_id: quiz86.id, text: "ビタミンA", correct: 0}
])
quiz87 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、皮膚や粘膜の健康維持に役立ち、滋養強壮にも用いられるビタミンはどれですか？', explanation: 'ビタミンAは皮膚や粘膜の健康維持に重要で、視力の維持や免疫機能の正常化にも寄与します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz87.id, text: "ビタミンA", correct: 1},
  {quiz_id: quiz87.id, text: "ビタミンB12", correct: 0},
  {quiz_id: quiz87.id, text: "ビタミンD", correct: 0}
])
quiz88 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、皮膚や粘膜の健康維持に効果があり、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'リボフラビン（ビタミンB2）は皮膚や粘膜の健康維持に重要で、エネルギー代謝にも関与します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz88.id, text: "リボフラビン", correct: 1},
  {quiz_id: quiz88.id, text: "パントテン酸", correct: 0},
  {quiz_id: quiz88.id, text: "ビタミンK", correct: 0}
])
quiz89 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '抗酸化作用があり、免疫機能をサポートするビタミンで、滋養強壮にも用いられるのはどれですか？', explanation: 'ビタミンCは強力な抗酸化作用を持ち、風邪の予防や免疫機能のサポートに役立ちます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz89.id, text: "ビタミンC", correct: 1},
  {quiz_id: quiz89.id, text: "ビタミンD", correct: 0},
  {quiz_id: quiz89.id, text: "ビタミンE", correct: 0}
])
quiz90 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、神経系の健康維持に役立ち、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'ピリドキシン（ビタミンB6）は神経系の健康維持に重要で、タンパク質の代謝や赤血球の生成にも関与します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz90.id, text: "ピリドキシン", correct: 1},
  {quiz_id: quiz90.id, text: "ナイアシン", correct: 0},
  {quiz_id: quiz90.id, text: "ビタミンK", correct: 0}
])
quiz91 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、骨の健康を維持し、滋養強壮にも役立つビタミンはどれですか？', explanation: 'ビタミンDはカルシウムとリンの吸収を促進し、骨の健康維持に必要です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz91.id, text: "ビタミンD", correct: 1},
  {quiz_id: quiz91.id, text: "ビタミンE", correct: 0},
  {quiz_id: quiz91.id, text: "ビタミンK", correct: 0}
])
quiz92 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、抗酸化作用があり、滋養強壮にも用いられるビタミンEの別名はどれですか？', explanation: 'トコフェロールはビタミンEの化学名で、強力な抗酸化作用があり、細胞の老化防止や免疫力向上に寄与します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz92.id, text: "トコフェロール", correct: 1},
  {quiz_id: quiz92.id, text: "アスコルビン酸", correct: 0},
  {quiz_id: quiz92.id, text: "リボフラビン", correct: 0}
])
quiz93 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、エネルギー代謝に関与し、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'チアミン（ビタミンB1）は炭水化物のエネルギー代謝に必要で、神経機能の維持にも重要な役割を果たします。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz93.id, text: "チアミン", correct: 1},
  {quiz_id: quiz93.id, text: "ビタミンA", correct: 0},
  {quiz_id: quiz93.id, text: "ビタミンC", correct: 0}
])
quiz94 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、血液凝固に関与し、骨の健康にも役立つビタミンはどれですか？', explanation: 'ビタミンKは血液の凝固因子の合成に必要で、骨の健康維持にも役立ちます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz94.id, text: "ビタミンK", correct: 1},
  {quiz_id: quiz94.id, text: "ビタミンD", correct: 0},
  {quiz_id: quiz94.id, text: "ビタミンE", correct: 0}
])
quiz95 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、水溶性ビタミンで、脂肪やタンパク質の代謝に関与し、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'ナイアシン（ビタミンB3）は脂肪やタンパク質の代謝に関与し、皮膚や神経の健康を維持するのに役立ちます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz95.id, text: "ナイアシン", correct: 1},
  {quiz_id: quiz95.id, text: "ビタミンD", correct: 0},
  {quiz_id: quiz95.id, text: "ビタミンE", correct: 0}
])
quiz96 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、赤血球の正常な成熟に関与し、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'ビタミンB12は赤血球の成熟に必要であり、神経系の健康維持にも役立ちます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz96.id, text: "ビタミンB12", correct: 1},
  {quiz_id: quiz96.id, text: "ビタミンC", correct: 0},
  {quiz_id: quiz96.id, text: "ビタミンD", correct: 0}
])
quiz97 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、タンパク質代謝に重要な役割を果たし、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'ビタミンB6はタンパク質の代謝に関与し、神経伝達物質の合成にも重要です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz97.id, text: "ビタミンB6", correct: 1},
  {quiz_id: quiz97.id, text: "ビタミンB12", correct: 0},
  {quiz_id: quiz97.id, text: "ビタミンC", correct: 0}
])
quiz98 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、細胞の成長と分裂に重要な役割を果たし、滋養強壮にも用いられるビタミンB群の成分はどれですか？', explanation: 'ビオチン（ビタミンB7）は細胞の成長と分裂に不可欠で、皮膚や髪の健康にも影響を与えます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz98.id, text: "ビオチン", correct: 1},
  {quiz_id: quiz98.id, text: "ビタミンA", correct: 0},
  {quiz_id: quiz98.id, text: "ビタミンE", correct: 0}
])
quiz99 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、赤血球の生成を支え、神経系の健康を維持するビタミンB群の成分はどれですか？', explanation: 'ビタミンB12は赤血球の生成を支え、神経系の健康を維持するのに必要なビタミンです。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz99.id, text: "ビタミンB12", correct: 1},
  {quiz_id: quiz99.id, text: "ビタミンB6", correct: 0},
  {quiz_id: quiz99.id, text: "ナイアシン", correct: 0}
])
quiz100 = Quiz.create!(quiz_set_id: quiz_set5.id, question: '次のうち、皮膚や粘膜の健康を支え、滋養強壮にも用いられるビタミンはどれですか？', explanation: 'ビタミンAは皮膚や粘膜の健康を支え、視力の維持にも重要な役割を果たします。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz100.id, text: "ビタミンA", correct: 1},
  {quiz_id: quiz100.id, text: "ビタミンD", correct: 0},
  {quiz_id: quiz100.id, text: "ナイアシン", correct: 0}
])





# 漢方薬クイズセット

quiz_set6 = QuizSet.create!(title: '漢方薬', description: '体質や症状に合わせて選択します、漢方薬は処方自体が1つの有効成分という見方になります')

quiz101 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、胃腸の調子を整え、食欲不振や消化不良に用いられます。また、体力が中等度以上で、胃の弱い人に向いています。', explanation: '四君子湯（しかんじとう）は、胃腸を強壮にする効果があり、特に消化不良や食欲不振に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz101.id, text: "四君子湯（しかんじとう）", correct: 1},
  {quiz_id: quiz101.id, text: "十全大補湯（じゅうぜんたいほとう）", correct: 0},
  {quiz_id: quiz101.id, text: "六君子湯（りっくんしとう）", correct: 0}
])
quiz102 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、風邪の初期症状や頭痛、鼻詰まりに用いられ、発汗を促して症状を和らげます。', explanation: '葛根湯（かっこんとう）は風邪の初期に用いられ、特に頭痛や鼻詰まりに効果的です。発汗作用があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz102.id, text: "葛根湯（かっこんとう）", correct: 1},
  {quiz_id: quiz102.id, text: "桂枝湯（けいしとう）", correct: 0},
  {quiz_id: quiz102.id, text: "麻黄湯（まおうとう）", correct: 0}
])
quiz103 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、咳や喘息の症状に用いられ、気道を広げる効果があります。', explanation: '小青竜湯（しょうせいりゅうとう）は、咳や喘息に効果がある漢方薬で、特に冷えによる気道の狭窄に用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz103.id, text: "小青竜湯（しょうせいりゅうとう）", correct: 1},
  {quiz_id: quiz103.id, text: "麻黄湯（まおうとう）", correct: 0},
  {quiz_id: quiz103.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 0}
])
quiz104 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、関節痛や筋肉痛に用いられ、炎症や痛みを和らげる効果があります。', explanation: '当帰芍薬散（とうきしゃくやくさん）は抗炎症作用があり、特に生理痛や関節痛に効果的な漢方薬です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz104.id, text: "当帰芍薬散（とうきしゃくやくさん）", correct: 1},
  {quiz_id: quiz104.id, text: "桂枝湯（けいしとう）", correct: 0},
  {quiz_id: quiz104.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 0}
])
quiz105 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、冷え性や生理不順に用いられ、体を温める効果があります。', explanation: '四物湯（しもつとう）は体を温め、血行を促進することで、冷え性や生理不順に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz105.id, text: "四物湯（しもつとう）", correct: 1},
  {quiz_id: quiz105.id, text: "当帰建中湯（とうきけんちゅうとう）", correct: 0},
  {quiz_id: quiz105.id, text: "当帰芍薬散（とうきしゃくやくさん）", correct: 0}
])
quiz106 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、利尿作用があり、むくみや高血圧の改善に用いられます。', explanation: '当帰四逆加呉茱萸生姜湯（とうきしぎゃくかごしゅゆしょうきょうとう）は、利尿作用に加えて、体を温める効果もあります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz106.id, text: "当帰四逆加呉茱萸生姜湯（とうきしぎゃくかごしゅゆしょうきょうとう）", correct: 1},
  {quiz_id: quiz106.id, text: "五苓散（ごれいさん）", correct: 0},
  {quiz_id: quiz106.id, text: "桂枝加芍薬湯（けいしかしゃくやくとう）", correct: 0}
])
quiz107 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、喉の痛みや咳に効果があり、風邪の治療に用いられます。', explanation: '桂枝湯（けいしとう）は、発汗作用を持ち、体を温めることで風邪の初期症状を和らげます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz107.id, text: "桂枝湯（けいしとう）", correct: 1},
  {quiz_id: quiz107.id, text: "麻黄湯（まおうとう）", correct: 0},
  {quiz_id: quiz107.id, text: "小青竜湯（しょうせいりゅうとう）", correct: 0}
])
quiz108 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、便秘に用いられ、腸の運動を促進します。', explanation: '大黄牡丹皮湯（だいおうぼたんぴとう）は、便秘改善に効果的で、特に腸の運動を活発化させます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz108.id, text: "大黄牡丹皮湯（だいおうぼたんぴとう）", correct: 1},
  {quiz_id: quiz108.id, text: "麻子仁湯（ましにんとう）", correct: 0},
  {quiz_id: quiz108.id, text: "当帰芍薬散（とうきしゃくやくさん）", correct: 0}
])
quiz109 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、血圧を下げる効果があり、高血圧の治療に用いられます。', explanation: '黄連解毒湯（おうれんげどくとう）は、高血圧の他に、熱を持つ症状にも用いられます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz109.id, text: "黄連解毒湯（おうれんげどくとう）", correct: 1},
  {quiz_id: quiz109.id, text: "天王補心丹（てんのうほしんたん）", correct: 0},
  {quiz_id: quiz109.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 0}
])
quiz110 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、不眠や神経過敏に効果があり、鎮静作用があります。', explanation: '桂枝茯苓丸（けいしぶくりょうがん）は、不眠や神経過敏に対して鎮静作用を持ち、ストレスや不安感を和らげます。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz110.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 1},
  {quiz_id: quiz110.id, text: "加味逍遥散（かみしょうようさん）", correct: 0},
  {quiz_id: quiz110.id, text: "当帰芍薬散（とうきしゃくやくさん）", correct: 0}
])
quiz111 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、ストレスや不安からくる胃腸の不調に用いられます。神経性の胃炎や胃痛に効果があります。', explanation: '安中散（あんちゅうさん）は、特にストレスによる胃腸の不調に対して有効です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz111.id, text: "安中散（あんちゅうさん）", correct: 1},
  {quiz_id: quiz111.id, text: "逍遥散（しょうようさん）", correct: 0},
  {quiz_id: quiz111.id, text: "加味帰脾湯（かみきひとう）", correct: 0}
])
quiz112 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、肩こりや頭痛、めまいに用いられ、血行促進や筋肉の緊張緩和に効果があります。', explanation: '釣藤散（ちょうとうさん）は、肩こりや頭痛に対して血行を促進し、筋肉の緊張を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz112.id, text: "釣藤散（ちょうとうさん）", correct: 1},
  {quiz_id: quiz112.id, text: "桂枝加葛根湯（けいしかっこんとう）", correct: 0},
  {quiz_id: quiz112.id, text: "半夏厚朴湯（はんげこうぼくとう）", correct: 0}
])
quiz113 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、皮膚の乾燥やかゆみ、湿疹に効果があります。血行を改善し、肌を潤す効果があります。', explanation: '酸棗仁湯（さんそうにんとう）は、皮膚の乾燥やかゆみに対して効果的で、血行を改善し、肌の健康を促進します。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz113.id, text: "酸棗仁湯（さんそうにんとう）", correct: 1},
  {quiz_id: quiz113.id, text: "当帰飲子（とうきいんし）", correct: 0},
  {quiz_id: quiz113.id, text: "桂枝加朮附湯（けいしかじゅつぶとう）", correct: 0}
])
quiz114 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、胃腸のむかつきや吐き気に用いられ、特に二日酔いや妊娠悪阻に効果があります。', explanation: '半夏白朮天麻湯（はんげびゃくじゅつてんまとう）は、胃腸の不調を改善し、特にむかつきや吐き気に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz114.id, text: "半夏白朮天麻湯（はんげびゃくじゅつてんまとう）", correct: 1},
  {quiz_id: quiz114.id, text: "加味逍遥散（かみしょうようさん）", correct: 0},
  {quiz_id: quiz114.id, text: "茯苓養心丸（ぶくりょうようしんがん）", correct: 0}
])
quiz115 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、精神的な緊張や不安による心臓の動悸や不眠に用いられます。', explanation: '人参養栄湯（にんじんようえいとう）は、神経を落ち着かせる効果があり、心の不安や不眠に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz115.id, text: "人参養栄湯（にんじんようえいとう）", correct: 1},
  {quiz_id: quiz115.id, text: "柴胡加竜骨牡蠣湯（さいこかりゅうこつぼれいとう）", correct: 0},
  {quiz_id: quiz115.id, text: "加味帰脾湯（かみきひとう）", correct: 0}
])
quiz116 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、ストレスや緊張による頭痛や肩こりに用いられます。リラックス効果もあります。', explanation: '逍遥散（しょうようさん）は、ストレスによる身体の痛みや緊張を和らげる効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz116.id, text: "逍遥散（しょうようさん）", correct: 1},
  {quiz_id: quiz116.id, text: "疎経活血湯（そけいかっけつとう）", correct: 0},
  {quiz_id: quiz116.id, text: "加味帰脾湯（かみきひとう）", correct: 0}
])
quiz117 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、女性特有の不調、特に生理痛や生理不順に用いられます。', explanation: '帰脾湯（きひとう）は、生理痛や生理不順など、女性の体調不良に効果的な漢方薬です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz117.id, text: "帰脾湯（きひとう）", correct: 1},
  {quiz_id: quiz117.id, text: "当帰四逆加呉茱萸生姜湯（とうきしぎゃくかごしゅゆしょうきょうとう）", correct: 0},
  {quiz_id: quiz117.id, text: "加味逍遥散（かみしょうようさん）", correct: 0}
])
quiz118 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、消化不良や食欲不振に用いられ、胃腸の働きを助けます。', explanation: '十全大補湯（じゅうぜんたいほとう）は、胃腸の強壮や食欲増進に効果があります。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz118.id, text: "十全大補湯（じゅうぜんたいほとう）", correct: 1},
  {quiz_id: quiz118.id, text: "人参養栄湯（にんじんようえいとう）", correct: 0},
  {quiz_id: quiz118.id, text: "桂枝加芍薬湯（けいしかしゃくやくとう）", correct: 0}
])
quiz119 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、気管支炎や気管支喘息に用いられ、呼吸を楽にします。', explanation: '麻黄湯（まおうとう）は、呼吸器系の症状を和らげる効果があり、特に気管支炎や喘息に効果的です。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz119.id, text: "麻黄湯（まおうとう）", correct: 1},
  {quiz_id: quiz119.id, text: "小青竜湯（しょうせいりゅうとう）", correct: 0},
  {quiz_id: quiz119.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 0}
])
quiz120 = Quiz.create!(quiz_set_id: quiz_set6.id, question: 'この漢方薬は、神経性の下痢や腹痛に用いられ、胃腸の機能を正常化します。', explanation: '柴胡加竜骨牡蠣湯（さいこかりゅうこつぼれいとう）は、神経性の胃腸の不調に対して効果的で、特に下痢や腹痛に用います。', drug_type: 1)
Choice.create!([
  {quiz_id: quiz120.id, text: "柴胡加竜骨牡蠣湯（さいこかりゅうこつぼれいとう）", correct: 1},
  {quiz_id: quiz120.id, text: "桂枝加芍薬湯（けいしかしゃくやくとう）", correct: 0},
  {quiz_id: quiz120.id, text: "桂枝茯苓丸（けいしぶくりょうがん）", correct: 0}
])
