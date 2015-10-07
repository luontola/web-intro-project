require 'sinatra'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite:my-database.db')
#DataMapper.setup(:default, 'sqlite::memory:')

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :picture, String
  property :author, String
  property :message, Text
  property :added, DateTime
end

DataMapper.finalize
#DataMapper.auto_migrate! # drops existing tables before recreating them
DataMapper.auto_upgrade!

$comments = []

get '/' do
  @title = "I'm Ruby"
  backstreet_boys = ["A.J.", "Howie", "Nick", "Kevin", "Brian"]
  @who_i_marry = backstreet_boys.sample
  erb :about
end

get '/pictures.html' do
  @title = "Lovely Pictures"
  @picture_urls = picture_urls
  erb :pictures
end

get '/pictures/:picture.html' do
  @title = "Picture"
  @picture = params['picture']
  @picture_url = find_picture_url(params['picture']) or halt 404
  @comments = $comments.select { |comment| comment[:picture] == params['picture'] }
  erb :picture
end

post '/add-comment' do
  $comments << {
    :picture => params['picture'],
    :author => params['author'],
    :message => params['message'],
    :added => DateTime.now
  }
  redirect '/pictures/' + params['picture'] + '.html'
end

not_found do
  "Page Not Found"
end

def picture_urls
  Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
end

def find_picture_url(basename)
  picture_urls.select { |path| File.basename(path, '.*') == basename }.first
end
