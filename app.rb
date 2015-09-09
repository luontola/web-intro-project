require 'sinatra'

get '/' do
  redirect to('/my-page.html')
end
