require 'sinatra'

PAGES = {
  :index => "I'm Ruby",
  :pictures => "Lovely Pictures",
  :story => "My Story",
}

get '/' do
  erb :index, :locals => {:title => 'I\'m Ruby', :pages => PAGES}
end

get '/pictures.html' do
  picture_urls = Dir['public/pictures/**'].map { |path| path.sub('public', '') }
  erb :pictures, :locals => {:picture_urls => picture_urls, :title => 'Lovely Pictures', :pages => PAGES}
end

# must be last; this will be used if none of the above matches the request
get '/:page.html' do |page|
  erb page.to_sym, :locals => {:title => '???', :pages => PAGES}
end
