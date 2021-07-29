defmodule Pheonix101Web.Router do
  use Pheonix101Web, :router

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

  scope "/", Pheonix101Web do
    pipe_through :browser

    get "/", PageController, :index

    get "/about", PageController, :about
    get "/wiki", PageController, :redirect_wiki

    resources "/products", ProductController
    resources "/customers", CustomerController
    resources "/orders", OrderController
    resources "/users", UserController
  end

  scope "/api", Pheonix101Web do
    pipe_through :api

    # Info Route about api
    get "/", ApiController, :index

    # Products scope
    scope "/products" do
      get "/query", ProductAPIController, :query
      get "/query/updated_today", ProductAPIController, :show_updated_today

      resources "/", ProductAPIController, except: [:new, :edit]
    end

    resources "/customers", CustomerApiController, except: [:new, :edit] do
      get "/orders", CustomerApiController, :orders_by_customer
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Pheonix101Web do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).

  # if Mix.env() in [:dev, :test] do
  #   import Phoenix.LiveDashboard.Router

  #   scope "/" do
  #     pipe_through :browser
  #     live_dashboard "/dashboard", metrics: Pheonix101Web.Telemetry
  #   end
  # end
end
