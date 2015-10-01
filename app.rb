require 'sinatra'
require 'data_mapper'

PAGES = {
  :index => "I'm Ruby",
  :pictures => "Lovely Pictures",
  :story => "My Story",
  :guestbook => "Guestbook",
}


DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'sqlite:my-database.db')
#DataMapper.setup(:default, 'sqlite::memory:')

class Comment
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :comment, Text
  property :date, DateTime
end

DataMapper.finalize
#DataMapper.auto_migrate! # drops existing tables before recreating them
DataMapper.auto_upgrade!


get '/' do
  render_page :index
end

get '/pictures.html' do
  picture_urls = Dir.glob('public/pictures/**').map { |path| path.sub('public', '') }
  render_page :pictures, {:picture_urls => picture_urls}
end

get '/guestbook.html' do
  render_page :guestbook, {:comments => Comment.all(:order => [:date.desc])}
end

post '/add-comment' do
  Comment.create(
    :name => params['name'],
    :comment => params['comment'],
    :date => DateTime.now
  )
  redirect '/guestbook.html'
end

get '/:page.html' do
  render_page params['page'].to_sym
end

def render_page(page, locals={})
  locals = locals.merge({:title => PAGES[page], :pages => PAGES})
  erb page, :locals => locals
end
