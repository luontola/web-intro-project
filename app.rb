require 'sinatra'

get '/' do
  redirect to('/my-page.html')
end

get '/:page.html' do
  erb params['page'].to_sym
end
