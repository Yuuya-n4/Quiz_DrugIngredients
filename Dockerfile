FROM ruby:3.1
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn
RUN apt-get update -qq && apt-get install -y chromium
RUN apt-get update -qq && apt-get install -y libpq-dev
WORKDIR /quiz_drug_ingredients
COPY Gemfile /quiz_drug_ingredients/Gemfile
COPY Gemfile.lock /quiz_drug_ingredients/Gemfile.lock
RUN bundle install
COPY . /quiz_drug_ingredients
RUN npm install
RUN npm run build:tailwind
RUN bin/rails assets:precompile
CMD ["rails", "server", "-b", "0.0.0.0"]
