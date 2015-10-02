require 'sinatra'

get '/' do
  backstreet_boys = ["A.J.", "Howie", "Nick", "Kevin", "Brian"]
  @who_i_marry = backstreet_boys.sample
  erb :about
end

get '/pictures.html' do
  @picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  erb :pictures
end
