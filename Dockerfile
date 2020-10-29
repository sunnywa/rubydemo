FROM ruby:2.5-alpine

WORKDIR /app

ADD /app /app

RUN  bundle install

CMD  bundle exec rackup -p 3000