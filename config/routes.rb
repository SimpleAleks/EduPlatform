Rails.application.routes.draw do
  get 'profile', to: 'home#profile', as: :profile
  get 'parents-teachers/link/:id', to: 'parents_teachers#link', as: :parents_teachers_link
  get 'parents-teachers/unlink/:id', to: 'parents_teachers#destroy_link', as: :parents_teachers_destroy_link
  resources :teachers
  resources :parents
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
