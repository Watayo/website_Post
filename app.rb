require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require "carrierwave"
require "carrierwave/orm/activerecord"
require './models'

require 'pry'
enable :sessions

#Configure Carrierwave
CarrierWave.configure do |config|
  config.root = File.dirname(__FILE__) + "/public"
end

# before '/' do
#   if current_user.nil?
#     redirect '/'
#   end
# end

# 今ログインしているユーザーをcurrentuserと定義
helpers do
  def current_user
    User.find_by(id: session[:user])
  end
end

get '/' do
  if current_user.nil?
    @posts = Post.none
  else
    @posts = current_user.posts
  end
  erb :index
end

get '/signin' do
  erb :signin
end

get '/signup' do
  erb :signup
end

get '/posting' do
  erb :posting
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    redirect '/'
  else
    redirect '/signin'
  end
end

post '/signup' do
  @user = User.create(
    name: params[:name],
    mail: params[:mail],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )
  if @user.persisted?
    session[:user] = @user.id
  end
  redirect '/'
end

post '/posting' do
  current_user.posts.create(
    title: params[:title],
    user_name: params[:name],
    content: params[:content],
    description: params[:description]
  )
  redirect '/'
end

get '/posts/:id' do
  @select_post = Post.find(params[:id])
  erb :select_post
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end
