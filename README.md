# 市販薬の成分クイズ

## サービス概要
市販の薬の成分について簡単にクイズ形式で学ぶことができるサービスです。

## 想定されるユーザー層
薬の知識に興味がある人
薬を自分で選ぶ知識をつけてみたい人
登録販売者資格に興味があって手軽に触れてみたい人

## サービスコンセプト
市販の薬は種類が多くて似た物も多く、どれが自分にあった薬なのか迷った人が多いと思います。また、登録販売者資格の勉強は初めは難しい単語がたくさん出てきて嫌になる人がほとんどです。
なので、風邪薬や漢方など簡単で興味を持ちやすい部分をクイズ形式で簡単に楽しく学ぶことができるサービスを考案しました。
私はドラッグストアで働いて登録販売者資格を取得しましたが、初めて登録販売者資格の勉強を始めた時、分厚くて知らない単語ばかりの参考書を進めていくのが大変で、周りの仲間も同じでした。
ただ、身近な薬など興味がある場所はみんな早く進み、私も楽しかったです。
学ぶ前は薬は自分で選ぶなんて難しいと思っていましたが、ちょっと知るだけでも楽しいです。
そこで、薬の知識が全くない人でも、簡単に楽しく薬を学べるサービスがあったらいいなと思い、このサービスを考えました。

## 実装を予定している機能
### MVP
* 会員登録
* ログイン
* クイズ選択
　　風邪薬や漢方などクイズの種類を選択できる画面を作る。
* クイズ機能
　　複数のクイズを連続で出題し、最後にスコア集計を表示する。
　　クイズは自分で用意し、最初は１分野だけ作り進めます。後に他分野も作成していきます。
* クイズ検索機能
　　クイズの薬の種類の他、本文解説文からも検索できるようにする。
　　マルチ検索・オートコンプリート機能をつける。
* 成績確認機能
　　過去の自分の各クイズの成績を確認できる。


### その後の機能
* 免疫アバター育成機能
　　登録販売者資格を目指したい人向けの機能。
　　クイズをクリアしていくとアバターが成長する。
　　勉強は毎日コツコツ続けて覚えることが大切なので通知機能で勉強を促す。
