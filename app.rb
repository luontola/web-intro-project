require 'sinatra'
require 'sinatra/reloader'

get '/' do
  @title = "I'm Ruby"
  backstreet_boys = ["A.J.", "Howie", "Nick", "Kevin", "Brian"]
  @who_i_marry = backstreet_boys.sample
  erb :about
end

get '/pictures.html' do
  @title = "Lovely Pictures"
  @picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  erb :pictures
end

get '/pictures/:picture.html' do
  "Here will be a page for " + params['picture']
end
