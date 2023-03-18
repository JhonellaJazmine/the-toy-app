Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  resources :users
  resources :microposts
 
  #registration
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  #basic login
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  #password reset
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  
  #for profile
  get "profile/:id", to: "profile#index", as:"profile"
  
  root to: "main#index"
end
