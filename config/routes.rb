Rails.application.routes.draw do
  resources :listings
  resources :reservations
  resources :users
  resources :venues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
