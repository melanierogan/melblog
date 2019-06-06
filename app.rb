require 'sinatra/base'
require './lib/blog'

class BloggerTime < Sinatra::Base
  get '/i' do
    erb(:index)
  end

  get '/' do
    @blogger_list = Blogger.all
    erb(:blog)
  end

  get '/submit' do
    erb(:submitblog)
  end

  post '/submit' do
    Blogger.create(name: params[:name], message: params[:message], created_on: params[:created_on])
    redirect '/'
  end

end