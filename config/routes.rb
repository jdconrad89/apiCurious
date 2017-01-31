Rails.application.routes.draw do
  root "home#index"

  get "/auth/github/callback",  to: "sessions#create"
  get "/recent_activity",       to: "recent_activity#index"
  get "/users/recent_activity", to: "users/recent_activity#index"
  get "/organizations",         to: "organizations#index"
  get "/repositories",          to: "repositories#index"

  resources :dashboard, only: [:index]
end
