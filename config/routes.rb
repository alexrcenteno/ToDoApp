Rails.application.routes.draw do
  resources :todos

  resources :categories
  resources :users

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
