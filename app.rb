require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'


get '/' do
  erb :index
end

get '/new' do
  erb :post
end

post '/new' do


  redirect '/new/done'
end

get '/new/done' do
  erb :post_complete
end

get '/find' do
  erb :select_camp
end

post 'find/list' do

end

get '/find/list/:id' do

end

post '/delete' do

end

post '/go' do

end
