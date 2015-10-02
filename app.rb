require 'sinatra'
require 'sinatra/reloader'

get '/' do
  redirect to('/about.html')
end
