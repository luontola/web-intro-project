require 'sinatra'

get '/' do
  redirect to('/my-page.html')
end

get '/foo' do
  IO.read('public/my-page.html')
end

get '/:page' do
  "You're on page " + params['page']
end
