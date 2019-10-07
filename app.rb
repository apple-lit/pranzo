require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'sinatra/activerecord'
require './models'


before do
  Dotenv.load
  Cloudinary.config do |config|
    config.cloud_name = ENV['CLOUD_NAME']
    config.api_key = ENV['CLOUDINARY_API_KEY']
    config.api_secret = ENV['CLOUDINARY_API_SECRET']
  end
end

get '/' do
  erb :index
end

get '/new' do
  erb :post
end

post '/new' do
  img_url = ''
  if params[:file]
    img = params[:file]
    tempfile = img[:tempfile]
    upload = Cloudinary::Uploader.upload(tempfile.path)
    img_url = upload['url']
  end

  Restaurant.create({
  body: params[:body],
  img: img_url
  })


  redirect '/new/done'
end

get '/new/done' do
  erb :post_complete
end

get '/back' do
  erb :index
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
