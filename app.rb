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
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  render_page :pictures, {:picture_urls => picture_urls}
end

get '/:page.html' do
  render_page params['page'].to_sym
end

def render_page(page, locals={})
  locals = locals.merge({:title => PAGES[page], :pages => PAGES})
  erb page, :locals => locals
end
