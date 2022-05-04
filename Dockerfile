FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

WORKDIR /app
COPY . ./ 
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000

ENTRYPOINT ["entrypoint.sh"]
