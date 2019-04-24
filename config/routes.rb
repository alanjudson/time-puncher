Rails.application.routes.draw do
  get "signup" => "users#new", as: "signup"
  get "login" => "sessions#new", as: "login"

  resources :sessions, only: [:new, :create]
  delete '/session', to: 'sessions#destroy'
  resources :users

  root "punchtimes#index"
  resources :punchtimes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
