defmodule Mousikin.Router do
  use Mousikin.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  scope "/", Mousikin do
    pipe_through :browser
    get "/", PageController, :index
    # Add public routes below
  end

  scope "/", Mousikin do
    pipe_through :protected
    # Add protected routes below
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mousikin do
  #   pipe_through :api
  # end
end
