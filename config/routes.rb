Rails.application.routes.draw do
  resources :reservations
  resources :mentor_topics
  resources :topics
  resources :mentors
  devise_for :users
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
