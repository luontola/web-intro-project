require 'sinatra'
require 'sinatra/reloader'

get '/' do
  redirect to('/about.html')
end

get '/about.html' do
  erb :about
end

get '/pictures.html' do
  erb :pictures
end
