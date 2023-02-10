Rails.application.routes.draw do
  resources :todos
  resources :category_todos
  resources :categories
  resources :users

  get "/signup" => "users#new"
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  get "/login" => "sessions#new"
  get "/logout" => "sessions#destroy"

  get "/todosbycategories" => "todos_by_categories#index"
end
