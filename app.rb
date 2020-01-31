require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'
enable :sessions

get '/' do
  erb :index
end

get '/signin' do
  erb :signin
end

get '/signup' do
  erb :signup
end

get '/post' do
  erb :post
end

post '/signin' do
  user = User.find_by(name: params[:name])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
    redirect "/"
  else
    redirect "/signin"
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

get '/signout' do
  session[:user] = nil
  redirect '/'
end