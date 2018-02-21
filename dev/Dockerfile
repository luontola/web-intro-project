FROM ruby:2.5

# cannot use Sinatra 2 because of https://github.com/sinatra/sinatra/issues/1294
RUN gem install sinatra:1.4.7 sinatra-contrib:1.4.7 data_mapper dm-sqlite-adapter erubis --no-ri --no-rdoc

WORKDIR /project

CMD ["ruby", "app.rb", "-o", "0.0.0.0"]
