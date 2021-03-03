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


end
