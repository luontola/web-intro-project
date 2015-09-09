require 'sinatra'

get '/' do
  erb :index
end

get '/pictures.html' do
  picture_urls = [
    "http://www.publicdomainpictures.net/pictures/50000/t2/cat-looking-up.jpg",
    "http://www.publicdomainpictures.net/pictures/30000/t2/cat-in-the-city-5.jpg",
    "http://www.publicdomainpictures.net/pictures/30000/t2/annoyed-cat.jpg",
    "http://www.publicdomainpictures.net/pictures/30000/t2/cat-in-the-city-2.jpg",
    "http://www.publicdomainpictures.net/pictures/50000/t2/cat-in-chair.jpg",
    "http://www.publicdomainpictures.net/pictures/30000/t2/cat-hunting.jpg",
    "http://www.publicdomainpictures.net/pictures/10000/t2/lieblingskater-44421287869401VYcy.jpg",
    "http://www.publicdomainpictures.net/pictures/60000/t2/cat-1382017414PaD.jpg",
    "http://www.publicdomainpictures.net/pictures/50000/t2/cat-1373445873hvw.jpg",
    "http://www.publicdomainpictures.net/pictures/40000/t2/cross-eyed-cat.jpg",
  ]
  erb :pictures, :locals => {:picture_urls => picture_urls}
end

# must be last; this will be used if none of the above matches the request
get '/:page.html' do |page|
  erb page.to_sym
end
