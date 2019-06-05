require 'sinatra/base'
require './lib/blog'

class BloggerTime < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/blog' do
    @blogger_list = Blogger.all
    erb(:blog)
  end

end