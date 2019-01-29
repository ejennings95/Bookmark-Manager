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
    Bookmark.add(params[:add_bookmark])
    redirect '/bookmarks'
  end


  run! if app_file == $0
end
