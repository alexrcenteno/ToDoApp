Rails.application.routes.draw do
  resources :todos

  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
end
