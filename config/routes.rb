Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/rentals/ads/new', to: 'rentals#new'
  # post '/rentals/ads/', to: 'rentals#create'
  resources :rentals, only: [:new, :create]
end
