Rails.application.routes.draw do
  root "sessions#new"

  resources :sessions

  resources :users

  resources :events

  resources :comments

  resources :joins

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
