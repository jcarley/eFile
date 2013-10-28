Efile::Application.routes.draw do

  root :to => "sessions#new"

  resources :items

  # match '/' => "sessions#new", :as => :login
  get '/home' => "home#index", :as => :home

  post '/auth/:provider/callback' => "sessions#create"
  post '/logout' => "sessions#destroy", :as => :logout
  post '/auth/failure' => "sessions#failure", :as => :login_failure

end
