Rails.application.routes.draw do

  root 'home#index'
  get 'home/about'
  get '/search', to: 'search#index'
  get '/restaurant', to: 'restaurant#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]

  # Login
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
end
