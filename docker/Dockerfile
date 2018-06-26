FROM ubuntu:16.04

RUN apt-get update && apt-get install -y make ruby-dev make gcc build-essential

RUN gem install bundler

WORKDIR /srv
COPY . /srv
RUN bundle install
RUN bundle exec jekyll build

FROM nginx:1.13
COPY --from=0 /srv/_site /usr/share/nginx/html/
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
