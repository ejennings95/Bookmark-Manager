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

  run! if app_file == $0
end
