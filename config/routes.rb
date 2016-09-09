Rails.application.routes.draw do
  resources :listings
  resources :reservations
  resources :users
  resources :venues
  root 'sessions#home', as: 'home'

  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
