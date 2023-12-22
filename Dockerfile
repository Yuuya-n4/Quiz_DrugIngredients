FROM ruby:3.1

# Node.jsとYarnのインストール
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update -qq && apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# 必要なパッケージのインストール
RUN apt-get update -qq && apt-get install -y chromium libpq-dev

WORKDIR /quiz_drug_ingredients

# GemfileとGemfile.lockをコピーし、bundle installを実行
COPY Gemfile Gemfile.lock ./
RUN bundle install

# プロジェクトのファイルをコピー
COPY . .

# npmパッケージのインストール
RUN npm install

# sassのインストール
RUN npm install -g sass

RUN npm run build
RUN npm run build:css
RUN npm run build:tailwind

# アセットプリコンパイルを本番環境で実行
RUN bin/rails assets:precompile

# デフォルトコマンドを設定
CMD ["rails", "server", "-b", "0.0.0.0", "-e", "production"]
