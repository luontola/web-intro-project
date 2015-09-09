require 'sinatra'

get '/' do
  redirect to('/my-page.html')
end

get '/:page' do |page|
  IO.read('public/' + page + '.html')
end
