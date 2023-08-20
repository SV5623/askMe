Rails.application.routes.draw do

  root to: 'questions#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
 
  resources :questions
  resources :users, only: %i[new create edit update destroy]
  resource :session, only: %i[new create destroy]
end
