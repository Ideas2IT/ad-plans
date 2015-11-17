Rails.application.routes.draw do
  resources :plans
  resources :features
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :subscriptions, only: [:create]
end
