require 'sinatra'

get '/' do
  erb :index
end

get '/pictures.html' do
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  erb :pictures, :locals => {:picture_urls => picture_urls}
end

get '/:page.html' do
  erb params['page'].to_sym
end
