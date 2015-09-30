require 'sinatra'

PAGES = {
  :index => "I'm Ruby",
  :pictures => "Lovely Pictures",
  :story => "My Story",
  :guestbook => "Guestbook",
}

get '/' do
  render_page :index
end

get '/pictures.html' do
  picture_urls = Dir['public/pictures/**'].map { |path| path.sub('public', '') }
  render_page :pictures, {:picture_urls => picture_urls}
end

get '/guestbook.html' do
  comments = IO.read('comments.txt') if File.exist?('comments.txt')
  render_page :guestbook, {:comments => comments}
end

post '/add-comment' do
  File.open('comments.txt', 'a') do |f|
    comment = erb :comment, :layout => false, :locals => {
      :name => params['name'],
      :comment => params['comment'],
      :date => DateTime.now
    }
    f.puts(comment)
  end
  redirect '/guestbook.html'
end

# must be last; this will be used if none of the above matches the request
get '/:page.html' do |page|
  render_page page.to_sym
end

def render_page(page, locals={})
  locals = locals.merge({:title => PAGES[page], :pages => PAGES})
  erb page.to_sym, :locals => locals
end
