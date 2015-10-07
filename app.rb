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
  @picture = params['picture']
  @picture_url = find_picture_url(params['picture']) or halt 404
  comments_file = 'comments_' + params['picture'] + '.txt'
  @comments = IO.read(comments_file) if File.exist?(comments_file)
  erb :picture
end

post '/add-comment' do
  File.open('comments_' + params['picture'] + '.txt', 'a') do |f|
    f.puts(params['author'] + ': ' + params['message'])
  end
  redirect '/pictures/' + params['picture'] + '.html'
end

not_found do
  "Page Not Found"
end

def picture_urls
  Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
end

def find_picture_url(basename)
  picture_urls.select { |path| File.basename(path, '.*') == basename }.first
end
