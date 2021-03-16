class BabiesController < ApplicationController

  get "/babies" do
    erb :"/babies/index.html"
  end

  get "/babies/new" do
    if logged_in?
      erb :"/babies/new.html"
    else
      redirect '/login'
    end
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

  get '/babies/:id' do 
    get_babies
    redirect_if_not_authorized_v2
    erb :"/babies/show.html"
  end

  get "/babies/:id/edit" do
    get_babies
    redirect_if_not_authorized_v2
    erb :"/babies/edit.html"
  end

  patch "/babies/:id" do
    get_babies
    @babies.update(name: params[:name], DOB: params[:DOB])
    redirect '/profile'
  end

  delete '/babies/:id' do 
    get_babies
    @babies.destroy
    redirect '/'
  end

  private

   def get_babies
     @babies = Baby.find_by(id:params[:id])
   end

   def redirect_if_not_authorized_v2
      if @babies.user_id != current_user[:id]
          redirect '/'
      end
   end 

end
