require 'sinatra'

PAGES = {
  :index => "I'm Ruby",
  :pictures => "Lovely Pictures",
  :story => "My Story",
  :guestbook => "Guestbook",
}

$comments = []

get '/' do
  render_page :index
end

get '/pictures.html' do
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  render_page :pictures, {:picture_urls => picture_urls}
end

get '/guestbook.html' do
  render_page :guestbook, {:comments => $comments}
end

post '/add-comment' do
  $comments << {
    :name => params['name'],
    :comment => params['comment'],
    :date => DateTime.now
  }
  redirect '/guestbook.html'
end

get '/:page.html' do
  render_page params['page'].to_sym
end

def render_page(page, locals={})
  locals = locals.merge({:title => PAGES[page], :pages => PAGES})
  erb page, :locals => locals
end
