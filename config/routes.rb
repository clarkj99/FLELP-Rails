Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :locations, only: [:index, :create, :show]
      post "/login", to: "auth#create"
      get "/profile", to: "users#profile"
    end
  end
end
