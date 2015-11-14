Rails.application.routes.draw do
  resources :plans, only: [:index]

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
