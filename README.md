# クイズ！市販薬の成分

## サービス概要
薬に興味のある人がクイズ形式で楽しく知って学べるサービスです。  
風邪薬、胃腸薬、皮膚薬、目口鼻、滋養強壮、漢方薬の6種類のクイズが現在あります。

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

## 実装を予定している機能
### MVP
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
    - クイズ検索（ransack）
    - オートコンプリート(React　1文字入力するごとに候補のクイズを下に小さく表示　質問、正解、解説、クイズセット名で検索可能）
- **星評価**
    - ５段階の星評価（React　react-stars）
    - 各クイズの後の解説画面で、そのクイズに対する評価を星５段階でユーザーから任意で評価をもらう
- **フィードバック**
    - クイズの最後のスコア画面で、ユーザーから任意で意見や感想をもらう
- **管理者機能（rails-admin　クイズ追加に使用）**
- **rails-adminカスタムアクション**
    - クイズは、クイズセット、クイズ、選択肢の３つのモデルで成り立つため、rails-adminそのままでは見ずらいので、１画面で見やすくまとめて見れるカスタムアクションを作成
- **デザイン**
    - メインサービスはTailwind CSS
    - rails-adminはBootstrap
- **メタタグ**
    - サイト名やキーワードやファビコンなど設定
    - 各ページごとにタイトルを設定してタブバーに表示
- **テスト（Rspec）**

### その後の機能
- コードの整形や整理
- クイズ機能のコントローラーやモデルの再確認
- クイズの質問や解説の改善
- デザイン改善
- テスト追加（Rspec）
- Twitter投稿機能



## 技術選定
■ 開発環境:  
　　Docker  
■ サーバサイド:  
　　Ruby 3.1.4  
　　Rails 7.0.8  
■ JSライブラリ:  
　　React 18.2.0  
■ CSSフレームワーク:  
　　Tailwind CSS（メインサービス）  
　　Bootstrap（rails-admin）  
■ インフラ:  
　　Webアプリケーションサーバ: Fly.io  
　　データベースサーバ: PostgreSQL


## ER図
[![Image from Gyazo](https://i.gyazo.com/8ad099775a7d41fa484b644cff5bffb7.png)](https://gyazo.com/8ad099775a7d41fa484b644cff5bffb7)

## 画面推移図(初期設定)
https://www.figma.com/file/T0MUmrxdxTFSt8GbwjJeKh/Untitled?type=design&node-id=0%3A1&mode=design&t=ZGE1ErUgt9xfZdxP-1


