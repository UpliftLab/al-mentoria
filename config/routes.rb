Rails.application.routes.draw do
  resources :reservations
  resources :topics
  resources :mentors do
    resources :mentor_topics, path: 'topics', only: %i[index create destroy]
  end
  devise_for :users,
    controllers: {
      registrations: :registrations,
      sessions: :sessions
    }
end
