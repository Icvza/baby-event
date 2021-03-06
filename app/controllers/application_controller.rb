require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions 
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :"/homepage.html" 
  end

  helpers do 

  def logged_in?
    !!session[:user_id]
  end 

  def user_events
    user_events = Event.where(user_id: session[:user_id])
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def users_babies
    @all_baby = Baby.where(user_id: session[:user_id])
  end

  def user_babies
    y = users_babies
    w = y.map {|baby| [baby.name, baby] }.to_h
    n = w.collect do |name, age|
      name
    end  
  end

end

end
