require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get '/' do
    'BookmarkManager'
  end

  run! if app_file == $0
end
