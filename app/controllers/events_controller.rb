class EventsController < ApplicationController

 
  get "/events" do
    @events = Event.where(user_id: session[:user_id])
    if logged_in?
      erb :"/events/index.html"
    else
      redirect 'login'
    end
  end

  get "/events/new" do
    @all_baby = Baby.where(user_id: session[:user_id])
    erb :"/events/new.html"
  end

  post "/events" do
    @event = Event.new(params)
    @event.user_id = session[:user_id]
    @event.baby_id = params[:baby_id]
    if @event.save
      redirect '/profile'
    else
      redirect '/event/new'
    end
  end

  get "/events/:id" do
    get_event
    erb :"/events/show.html"
  end

  get "/events/:id/edit" do
    get_event
    erb :"/events/edit.html"
  end

  patch "/events/:id" do
    get_event
    redirect_if_not_authorized
    @event.update(time: params[:time], content: params[:content])
    redirect '/profile'
  end

  # DELETE: /events/5/delete
  # delete "/events/:id/delete" do
  #   get_event
  #   @event.destory
  #   redirect "/profile"
  # end

  delete '/events/:id' do 
    get_event
    @event.destroy
    redirect '/profile'
  end 

private

  def get_event
    @event = Event.find_by(id:params[:id])
  end

  def redirect_if_not_authorized
    if @event.user_id != current_user[:id]
        flash[:error] = "You cant make this edit, you don't own this"
        redirect '/'
    end
  end 

end
