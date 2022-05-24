Rails.application.routes.draw do
  root "foods#index"
  resources :foods
  resources :kinds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
