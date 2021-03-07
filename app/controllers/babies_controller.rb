class BabiesController < ApplicationController

  get "/babies" do
    erb :"/babies/index.html"
  end

  get "/babies/new" do
    erb :"/babies/new.html"
  end

  post "/new_baby" do 
    @baby = Baby.new(params)
    @baby.user_id = session[:user_id]
    if @baby.save
      redirect '/profile'
    else
      redirect "/babies/new"
      end
  end

end
