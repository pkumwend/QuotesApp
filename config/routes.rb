Rails.application.routes.draw do
  #get "search/index"
  resources :category_quotes
  resources :quotes
  resources :sources
  resources :categories
  resources :users
  
  root 'home#index'
  get '/about', to: 'about#index'
  get '/search', to: 'search#index'
  get "up" => "rails/health#show", as: :rails_health_check

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get '/admin', to: 'home#aindex'
  get '/userhome', to: "home#uindex"
  get '/your-quotes', to: 'home#uquotes'


end
