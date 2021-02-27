class UsersController < ApplicationController


  get "/signup" do
    erb :"/users/signup.html"
  end

  post "/signup" do
    user = User.new(params)
    form_data = params.values
    empty = ""
    if params.has_value?(empty)
      redirect "/signup"
    else
      "NO"
    end
  end

    # # GET: /users/new
    # get "/users/new" do
    #   erb :"/users/new.html"
    # end

  # # GET: /users/5
  # get "/users/:id" do
  #   erb :"/users/show.html"
  # # end

  # # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end

  # # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end
end
