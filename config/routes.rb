Rails.application.routes.draw do
  root "home#index"

  get "/auth/github/callback",  to: "sessions#create"
  get "/recent_activity",       to: "recent_activity#index"
  get "/users/recent_activity", to: "users/recent_activity#index"
  get "/repos",                 to: "users#repos"
  post '/new_repo',             to: 'users#new_repo'

  resources :dashboard,         only: [:index]
  resources :users
end
