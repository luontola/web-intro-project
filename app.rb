require 'sinatra'

get '/' do
  redirect to('/my-page.html')
end

get '/:page.html' do |page|
  erb page.to_sym
end
