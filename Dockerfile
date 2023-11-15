FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y nodejs yarn
WORKDIR /quiz_drug_ingredients
COPY Gemfile /quiz_drug_ingredients/Gemfile
COPY Gemfile.lock /quiz_drug_ingredients/Gemfile.lock
RUN bundle install
COPY . /quiz_drug_ingredients
CMD ["rails", "server", "-b", "0.0.0.0"]