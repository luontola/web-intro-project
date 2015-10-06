require 'sinatra'

get '/' do
  @title = "I'm Ruby"
  backstreet_boys = ["A.J.", "Howie", "Nick", "Kevin", "Brian"]
  @who_i_marry = backstreet_boys.sample
  erb :about
end

get '/pictures.html' do
  @title = "Lovely Pictures"
  @picture_urls = picture_urls
  erb :pictures
end

get '/pictures/:picture.html' do
  @title = "Picture"
  @picture_url = find_picture_url(params['picture'])
  erb :picture
end

def picture_urls
  Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
end

def find_picture_url(basename)
  picture_urls.select { |path| File.basename(path, '.*') == basename }.first
end
