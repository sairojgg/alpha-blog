FROM ruby

WORKDIR /home/app

COPY Gemfile Gemfile

ENV PORT 3000

EXPOSE $PORT

RUN gem install rails bundler
RUN gem install rails
RUN apt-get update -qq

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -

RUN apt install nodejs
RUN npm install -g yarn

RUN bundle install
RUN rails webpacker:install

ENTRYPOINT [ "/bin/bash" ]

# docker-compose build
# docker-compose run --rm --service-ports ruby_dev

