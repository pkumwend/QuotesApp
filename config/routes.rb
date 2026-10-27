Rails.application.routes.draw do
  resources :category_quotes
  resources :quotes
  resources :sources
  resources :categories
  resources :users
  
  root 'home#index'
  get '/about', to: 'about#index'
  get '/search', to: 'search#index'
  get "up" => "rails/health#show", as: :rails_health_check

end
 