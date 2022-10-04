FROM ruby:2.6.6

RUN apt-get update -qq && \
  curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get install -y nodejs && \
  npm install --global yarn 

WORKDIR /app

COPY Gemfile /app/Gemfile

COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.3.22 && bundle update --bundler
