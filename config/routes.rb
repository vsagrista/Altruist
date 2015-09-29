Rails.application.routes.draw do
  devise_for :users
  get 'profile', to: 'users#profile'
  root to: 'users#profile'
  resources :users, only: [:index, :show, :edit, :update, :destroy] 
end
