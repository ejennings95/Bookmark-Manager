require 'sinatra/base'
require_relative '../lib/bookmark.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'BookmarkManager'
  end

  get '/bookmarks' do
    @list = Bookmark.list
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    Bookmark.add(title: params[:title], url: params[:url])
    redirect '/bookmarks'
  end

  get '/remove_bookmark' do
    @table = Bookmark.list
    erb(:remove_bookmark)
  end

  post '/remove' do
    p params
    Bookmark.remove(id: params[:id])
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
