FROM iron/ruby:dev 
RUN apk update && apk upgrade 
RUN apk add nodejs # Yes, Rails requires node... ¯\_(ツ)_/¯
WORKDIR /app
ADD Gemfile* /app/
RUN bundle install 
ADD . /app/ 
CMD ["rails", "server"]
