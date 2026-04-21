Rails.application.routes.draw do
  get "events", to: "events#index"
  get 'pages/home'
  devise_for :users
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "cities", to: "pages#cities"
  get "how_it_works", to: "pages#how_it_works"
  get "matching", to: "pages#matching"
  get "membership", to: "pages#membership"
  # Defines the root path route ("/")
  root to: "pages#home"
end
