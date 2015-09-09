require 'sinatra'

get '/' do
  erb :index
end

get '/:page.html' do |page|
  erb page.to_sym
end
