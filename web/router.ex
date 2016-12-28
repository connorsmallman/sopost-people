defmodule SopostPeople.Router do
  use SopostPeople.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SopostPeople do
    pipe_through :browser # Use the default browser stack

    get "/", PeopleController, :index
    get "/:location", PeopleController, :show
    get "/people/new", PeopleController, :new
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", SopostPeople do
    pipe_through :api

    resources "/people", PeopleController, only: [:create]
  end
end
