# クイズ！市販薬の成分

## サービス概要
薬に少しでも興味のある人が、クイズ形式で楽しく知って学べるサービスです。

### クイズの種類 
『風邪薬』『胃腸薬』『皮膚薬』『目口鼻』『滋養強壮』『漢方薬』

### サービスURL
https://www.quiz-drugingredients.com/

## 想定されるユーザー層
薬の知識に興味がある人  
登録販売者資格に興味がある人  
薬を買う時に自分である程度考えてから販売者に相談したい人  

## サービスコンセプト
市販の薬は種類が多くて似た物も多く、どれが自分にあった薬なのか迷った人が多いと思います。また、登録販売者資格の勉強は初めは難しい単語がたくさん出てきて嫌になる人がほとんどです。  
なので、風邪薬や漢方など簡単で興味を持ちやすい部分をクイズ形式で簡単に楽しく学ぶことができるサービスを考案しました。  
私はドラッグストアで働いて登録販売者資格を取得しましたが、初めて登録販売者資格の勉強を始めた時、分厚くて知らない単語ばかりの参考書を進めていくのが大変で、周りの仲間も同じでした。  
ただ、身近な薬など興味がある場所はみんな早く進み、私も楽しかったです。  
学ぶ前は薬は自分で選ぶなんて難しいと思っていましたが、ちょっと知るだけでも楽しいです。  
そこで、薬の知識が全くない人でも、簡単に楽しく薬を学べるサービスがあったらいいなと思い、このサービスを考えました。  

## メインの機能
- 市販薬の成分の問題を出題する　**「クイズ機能」**
- 苦手を克服するやり込み要素の　**「苦手克服チャレンジ」**
- 1文字入力するごとに自動で検索され表示される　**「クイズ検索機能」**
- 管理者がサービス向上に繋げる　**「ユーザーからのクイズの５段階★星評価機能」**
- 管理者がサービス向上に繋げる　**「ユーザーからのクイズセットのフィードバック機能」**
- 3つのモデルからなるクイズを１画面で見やすくまとめたページを追加した　**「RailsAdmin画面」**
- PC画面やスマホ画面など画面の大きさによってデザインの変化やヘッダー機能の変化　**「レスポンシブデザイン」**

|クイズ機能|苦手克服チャレンジ|
|:--:|:--:|
|![eef5a98f0dde97953ea688e5d24d0f18](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/484f696f-da85-40c1-a046-9247128be1c3)|![a4cf07eefc2127cd20cbc0f0b8f47923](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/518cd0e7-ca65-49d2-8bbf-b8772133abe2)|

|クイズ検索機能|RailsAdminカスタム画面|
|:--:|:--:|
|![16134bd353284b0f644c577d9c3125f4](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/d6b8094d-cee2-4233-9cb3-d15613b3bf90)|![76c9b9bd55050d6c0153b1c120e170b1](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/d4fa690d-66cf-41ff-ba8d-cf8d66436bd2)|

|PC画面|スマホ画面|
|:--:|:--:|
|![be333d33ab4cc9552a381b01706c1c5c](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/83aab7cf-fedb-4b8f-b832-777509a45e67)|![aa4d4202065fddf79ce4f6b190e61c5a](https://github.com/Yuuya-n4/Quiz_DrugIngredients/assets/127364780/5c552d51-5409-4fb8-9bdb-b68cff0ec57b)|


## 機能一覧
- **会員登録（devise）**
- **ログイン、ログアウト**
- **ユーザー情報変更**
- **パスワード忘れをメールで再設定（devise）**
- **クイズ**
    - [ 開始画面→クイズ画面←→解説画面→スコア画面 ]という画面推移
    - 各クイズセットの中から１０問をランダムで連続出題してスコアを出す
    - 出題と選択肢の表示の順番はランダム
    - クイズ中、現在何問目かを表示
- **苦手克服チャレンジ**
    - 「苦手な問題数」「苦手克服した問題数」「定着している問題数」を判定し表示
    - 苦手な問題を判定し、その中からランダムで10問出題する
    - 苦手をどれだけ克服したかの割合を計算、ユーザーは100%を目指す
- **クイズ不正防止**
    - クイズ中に同じクイズには1回しか答えられない
    - その時に出題予定のないクイズには答えられない
- **クイズの過去スコア表示**
- **クイズ一覧**
    - クイズ検索（React）
    - 検索機能は、1文字入力するごとに「質問」「正解」「解説」「クイズセット名」で自動で検索されて表示される
- **Twitter(X)投稿機能**
    - クイズのスコア画面で、成績を投稿できる
    - 苦手克服チャレンジの画面で、苦手克服度を投稿できる
- **★星評価**
    - ５段階の星評価（React　react-stars）
    - 各クイズの後の解説画面で、そのクイズに対する評価を星５段階でユーザーから任意で評価をもらう
    - ユーザーからの評価をもらい、分析やサービス改善に役立てます
- **フィードバック**
    - クイズの最後のスコア画面で、ユーザーから任意で意見や感想をもらう
    - ユーザーから意見や感想をもらい、サービス改善に役立てる
- **管理者機能（rails-admin）**
    - 主にクイズの確認や追加などに使用
- **Adminクイズ表**
    - rails-adminそのままでは不便な部分もあるのでカスタムアクションで作成
    - クイズは、クイズセット、クイズ、選択肢の３つのモデルで成り立つため、rails-adminそのままでは見ずらいので、１画面で見やすくまとめて見れるカスタムアクションを作成
- **デザイン**
    - メインサービスはTailwind CSS
    - rails-adminはBootstrap
    - トップページのサービス説明を開閉式にしてコンパクトにしています
    - 画面の大きさが変化しても見やすいように調整
- **メタタグ**
    - サイト名やキーワードやファビコンなど設定
    - 各ページごとにタイトルを設定してタブバーに表示
- **テスト（Rspec）**
- **Google Analytics**


## 技術選定
■ 開発環境:  
　　Docker  
■ サーバサイド:  
　　Ruby 3.1.4  
　　Rails 7.0.8  
■ JSライブラリ:  
　　React 18.2.0  
■ ビルドツール:  
　　esbuild 0.19.10  
　　sass  
■ CSSフレームワーク:  
　　Tailwind CSS  
　　Bootstrap（rails-admin）  
■ インフラ:  
　　Webアプリケーションサーバ: Fly.io  
　　データベースサーバ: PostgreSQL


## ER図
[![Image from Gyazo](https://i.gyazo.com/2bc070b232fd0e6f30b65304fb28eb4f.png)](https://gyazo.com/2bc070b232fd0e6f30b65304fb28eb4f)

## 画面推移図(初期設定)
https://www.figma.com/file/T0MUmrxdxTFSt8GbwjJeKh/Untitled?type=design&node-id=0%3A1&mode=design&t=ZGE1ErUgt9xfZdxP-1


