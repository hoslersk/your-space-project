Rails.application.routes.draw do
  resources :listings
  resources :reservations
  resources :users, except: :new
  resources :venues
  root 'sessions#home', as: 'home'

  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'
  get '/venueinfo', to: 'venues#get_venues_for_map'

  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create', as: 'registration'
  get 'my_venues', to: 'venues#my_venues', as: 'my_venues'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
