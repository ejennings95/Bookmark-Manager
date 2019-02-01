require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/bookmark.rb'
require_relative '../lib/comment.rb'
require_relative '../lib/database_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    'BookmarkManager'
  end

  get '/bookmarks' do
    @list = Bookmark.list
    @comment_list = Comment.list
    erb(:bookmarks)
  end

  post '/bookmarks' do
    flash[:warning] = "Bookmark not saved - url is incorrect" unless Bookmark.add(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  get '/remove_bookmark' do
    @table = Bookmark.list
    erb(:remove_bookmark)
  end

  delete '/bookmarks' do
    Bookmark.remove(id: params[:id])
    redirect '/bookmarks'
  end

  get '/update_bookmark' do
    @table = Bookmark.list
    erb(:update_bookmark)
  end

  post '/update' do
    @bookmark = Bookmark.list.find { | bookmark | bookmark.id == params[:id] }
    erb(:update_id)
  end

  patch '/bookmarks' do
    if Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
      redirect '/bookmarks'
    else
      flash[:warning] = "Bookmark not saved - url is incorrect"
      redirect '/bookmarks'
    end
  end

  get '/add_comment' do
    @bookmark = Bookmark.list.find { | bookmark | bookmark.id == params[:id] }
    erb(:add_comment)
  end

  post '/add_comment' do
    p params
    Comment.add(text: params[:comment], bookmark_id: params[:id] )
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
