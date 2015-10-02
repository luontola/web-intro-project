require 'sinatra'

PAGES = {
  :index => "I'm Ruby",
  :pictures => "Lovely Pictures",
  :story => "My Story",
}

get '/' do
  erb :index, :locals => {:title => PAGES[:index], :pages => PAGES}
end

get '/pictures.html' do
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  erb :pictures, :locals => {:picture_urls => picture_urls, :title => PAGES[:pictures], :pages => PAGES}
end

get '/:page.html' do
  page = params['page'].to_sym
  erb page, :locals => {:title => PAGES[page], :pages => PAGES}
end
