Rails.application.routes.draw do
  resources :orders
  get "order/add_product", to: "orders#add_product", as: "add_product"

  resources :products
  resources :clients
  get "client/show_orders", to: "clients#show_orders", as: "show_orders"

  resources :users

  get "up" => "rails/health#show", as: :rails_health_check

  #dasboard
  get "dashboard", to: "dashboard#index", as: "dashboard"

  #sessions
  resources :sessions, only: %i(new create destroy)
  get "autenticar" => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair" => "sessions#destroy"

  root to: "sessions#new", as: "login"

  get "/signup", to: "users#new", as: "signup"
end
