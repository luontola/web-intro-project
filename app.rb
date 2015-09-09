require 'sinatra'

get '/' do
  erb :index
end

get '/pictures.html' do
  picture_urls = Dir['public/pictures/**'].map { |path| path.sub('public', '') }
  erb :pictures, :locals => {:picture_urls => picture_urls}
end

# must be last; this will be used if none of the above matches the request
get '/:page.html' do |page|
  erb page.to_sym
end
