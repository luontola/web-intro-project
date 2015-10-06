require 'sinatra'

get '/' do
  redirect to('/about.html')
end

get '/about.html' do
  backstreet_boys = ["A.J.", "Howie", "Nick", "Kevin", "Brian"]
  @who_i_marry = backstreet_boys.sample
  erb :about
end

get '/pictures.html' do
  erb :pictures
end
