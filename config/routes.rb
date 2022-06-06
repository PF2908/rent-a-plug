Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :ads do
    resources :rentals, only: [:new, :create, :destoy]
    resources :ratings, only: [:create, :destroy]
  end
end
