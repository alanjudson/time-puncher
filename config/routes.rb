Rails.application.routes.draw do
  resources :posts
  get "signup" => "users#new"

  resources :sessions, only: [:new, :create]
  delete '/session', to: 'sessions#destroy'
  resources :users

  root "punchtimes#index"
  resources :punchtimes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
