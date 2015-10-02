require 'sinatra'

get '/' do
  erb :index, :locals => {:title => "I'm Ruby"}
end

get '/pictures.html' do
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  erb :pictures, :locals => {:picture_urls => picture_urls, :title => "Lovely Pictures"}
end

get '/:page.html' do
  erb params['page'].to_sym, :locals => {:title => '???'}
end
