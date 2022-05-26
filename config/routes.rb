Rails.application.routes.draw do
  root "foods#index"
  get 'login', to:'person_sessions#new'
  post 'login', to:'person_sessions#create'
  delete 'logout', to:'person_sessions#destroy'
  resources :people
  resources :foods
  resources :kinds
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
