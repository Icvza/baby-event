class EventsController < ApplicationController

  # GET: /events
  get "/events" do
    erb :"/events/index.html"
  end

  # GET: /events/new
  get "/events/new" do
    @all_baby = Baby.where(user_id: session[:user_id])
    erb :"/events/new.html"
  end

  # POST: /events
  post "/events" do
    @event = Event.new(params)
    @event.user_id = session[:user_id]
    @event.baby_id = params[:baby_id]
    binding.pry
    if @event.save
      redirect '/profile'
    else
      redirect '/event/new'
    end
  end

  # GET: /events/5
  get "/events/:id" do
    erb :"/events/show.html"
  end

  # GET: /events/5/edit
  get "/events/:id/edit" do
    erb :"/events/edit.html"
  end

  # PATCH: /events/5
  patch "/events/:id" do
    redirect "/events/:id"
  end

  # DELETE: /events/5/delete
  delete "/events/:id/delete" do
    redirect "/events"
  end
end
