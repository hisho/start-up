FROM ruby:3.1.0

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list
RUN set -x && apt-get update -y -qq && apt-get install -yq mariadb-client vim

RUN mkdir /rails
WORKDIR /rails

COPY Gemfile /rails/Gemfile
COPY Gemfile.lock /rails/Gemfile.lock

RUN bundle install

COPY . /rails

RUN chmod 744 docker-startup.sh

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["./docker-startup.sh"]
