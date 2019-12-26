Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :locations, only: [:index, :create, :show, :destroy]
      resources :businesses, only: [:index, :show, :create, :destroy]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"
    end
  end
end
