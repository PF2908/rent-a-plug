Rails.application.routes.draw do
  devise_for :users
  root to: 'ads#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/rentals/ads/new', to: 'rentals#new'
  post '/rentals/ads/', to: 'rentals#create'
end
