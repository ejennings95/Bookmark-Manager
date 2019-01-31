require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/bookmark.rb'
require_relative '../lib/database_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'BookmarkManager'
  end

  get '/bookmarks' do
    @list = Bookmark.list
    erb(:bookmarks)
  end

  post '/add_bookmark' do
    flash[:warning] = "Bookmark not saved - url is incorrect" unless Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/remove_bookmark' do
    @table = Bookmark.list
    erb(:remove_bookmark)
  end

  post '/remove' do
    Bookmark.remove(id: params[:id])
    redirect '/bookmarks'
  end

  get '/update_bookmark' do
    @table = Bookmark.list
    erb(:update_bookmark)
  end

  post '/update' do
    if Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
      redirect '/bookmarks'
    else
      flash[:warning] = "Bookmark not saved - url is incorrect"
      redirect '/update_bookmark'
    end
  end

  run! if app_file == $0
end
