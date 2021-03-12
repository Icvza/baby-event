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

  get '/babies/:id' do 
    get_babies
    erb :"/babies/show.html"
  end

  get "/babies/:id/edit" do
    get_babies
    erb :"/babies/edit.html"
  end

  patch "/babies/:id" do
    get_babies
    redirect_if_not_authorized
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

   def redirect_if_not_authorized
      if @babies.user_id != current_user[:id]
          flash[:error] = "You cant make this edit, you don't own this"
          redirect '/'
      end
   end 

end
