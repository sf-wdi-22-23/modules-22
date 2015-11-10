Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :food
  root to: "welcome#index"
  # to enable this route, can generate a controller in Terminal with
          # rails g controller welcome
  # then create an index action in the controller (see app/controllers/welcome_controller.rb)
  # and create an index view (see app/views/welcome/index.html.erb)

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  delete "/sessions/:id", to: "sessions#destroy"

  get "/sign_up", to: "users#new", as: "sign_up"

  resources :users, only: [:new, :create, :show]
end
