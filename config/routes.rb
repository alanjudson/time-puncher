Rails.application.routes.draw do
  resources :users
  root "punchtimes#index"
  resources :punchtimes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
