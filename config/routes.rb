Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  
  namespace :admin do
    get 'dashboard', to: 'dashboard#index', as: 'dashboard'
    resources :posts
  end

  # Set the root path to /posts (posts#index)
  root to: redirect('/posts')

  resources :posts, only: [:index, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check
end
