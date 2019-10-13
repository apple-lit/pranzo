require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'json'
require 'sinatra/activerecord'
require './models'
require 'open-uri'
require 'net/http'


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


  uri = URI("https://map.yahooapis.jp/geocode/V1/geoCode")
  uri.query = URI.encode_www_form({
    query: params[:address],
    appid: 'dj00aiZpPTkxVXVTTGgzbVBUMCZzPWNvbnN1bWVyc2VjcmV0Jng9MjU-
',
    output: 'json'

  })

  res = Net::HTTP.get_response(uri)
  json = JSON.parse(res.body)
  @latlon = json["Coordinates"]

p JSON.parse(res.body)

  Restaurant.create({
    restaurants: params[:restaurants],
    image: img_url,
    genre: params[:genre],
    name: params[:mentor],
    adress: params[:adress],
    camp: params[:camp]
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

post '/find/list' do
  @list = Restaurant.all.order('id desc')
  @camp_place = Camp.all.order('id desc')

  erb :list
end

get '/find/list/:id' do

end

post '/delete' do

end

post '/go' do

end
