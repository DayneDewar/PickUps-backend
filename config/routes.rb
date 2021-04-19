Rails.application.routes.draw do
  resources :user_events
  resources :events
  resources :favorite_sports
  resources :sports
  resources :users

  patch "/users/:id/player_rating", to: "users#player_rating"
  get "/me", to: "users#me"
  patch "/me", to: "users#update"
  post "/login", to: "users#login"
  post "/signup", to: "users#signup"
  post "/cancel", to: "user_events#cancel"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
