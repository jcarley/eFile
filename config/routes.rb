Efile::Application.routes.draw do
  root :to => "sessions#new"

  # match '/' => "sessions#new", :as => :login
  match '/home' => "home#index", :as => :home

  match '/auth/:provider/callback' => "sessions#create"
  match '/logout' => "sessions#destroy", :as => :logout
  match '/auth/failure' => "sessions#failure", :as => :login_failure

end
