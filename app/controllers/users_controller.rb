class UsersController < ApplicationController

  get "/signup" do
    erb :"/users/signup.html"
  end

  post "/signup" do
    user = User.new(params)
    checker = !User.find_by(email: params["email"]) && !User.find_by(username: params["username"])
    if checker && user.save
      session[:user_id] = user.id
      redirect '/babies/new'
    else
      redirect '/signup'
    end
  end

  get "/login" do 
    erb :"/users/login.html"
  end

  post "/login" do 
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/profile'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/profile' do
    if logged_in?
     erb :"/users/profile.html"
     else
      redirect '/login'
     end
  end

  get '/users/:id/edit' do 
    if logged_in? && params[:id].to_i == current_user.id  
     erb :"/users/edit.html"
    else
      redirect '/'
    end
  end 

  patch "/users/:id" do
    get_user
    redirect_if_not_authorized_v3
    @usersp.update(name: params[:name], username: params[:username], email: params[:email] , password: params[:password])
    redirect '/profile'
  end

  private

  def get_user
    @usersp = User.find_by(id:params[:id])
  end

  def redirect_if_not_authorized_v3
     if session[:user_id] != params[:id].to_i
         redirect '/'
     end
  end 




end
