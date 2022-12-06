Rails.application.routes.draw do
  devise_for :users, controllers: {
     sessions: 'users/sessions', registrations: 'users/registrations'
  }
  root to: "pages#home"
  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "profile/:id", to: "pages#profile", as: :profile
  get "users", to: "pages#users"
  get "map", to:"foodplaces#map"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foodplaces do
    resources :reviews, only: :create
  end
  # resources :reviews
  get "map", to: "foodplaces#map"
  resources :lists do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
  # not sure about the routes
  get "follow", to: "followers#follow"
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"
end
