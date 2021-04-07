Rails.application.routes.draw do
  resources :user_events
  resources :events
  resources :favorite_sports
  resources :sports
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
