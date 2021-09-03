Rails.application.routes.draw do
  resources :friends
  resources :friendships
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
  post "/add_friend", to: "friends#add_friend"
  post "/decline_friend", to: "friends#decline_friend"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
