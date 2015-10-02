require 'sinatra'

get '/' do
  redirect to('/about.html')
end
