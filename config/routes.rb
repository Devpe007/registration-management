Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :sessions, only: %i(new create destroy)
  get "autenticar" => "sessions#new"
  post "autenticar" => "sessions#create"
  delete "sair" => "sessions#destroy"

  root to: "sessions#new", as: "login"

  get "/signup", to: "users#new", as: "signup"
end
