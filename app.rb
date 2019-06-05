require 'sinatra/base'

class Blogger < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/blog' do
    @bookmarks_list = Bookmark.all
    erb(:bookmarks)
  end

end