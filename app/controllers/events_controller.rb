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
    if logged_in? 
    get_event
      if get_event == nil || redirect_if_not_authorized
        redirect '/profile'
      else
    erb :"/events/show.html"
      end
    else 
      redirect '/profile'
    end
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
