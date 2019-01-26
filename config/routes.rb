Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
  resources :tasks,only: [:show,:create,:edit,:update,:destroy]
end