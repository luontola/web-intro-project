require 'sinatra'

get '/' do
  erb :index
end

get '/:page.html' do
  erb params['page'].to_sym
end
