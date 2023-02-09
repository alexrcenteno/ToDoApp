Rails.application.routes.draw do
  resources :todos
  resources :category_todos
  resources :categories
  resources :users

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

end
