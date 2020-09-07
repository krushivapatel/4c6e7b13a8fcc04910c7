Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:create, :index]
  get '/profile', to: 'relationships#profile'
  get '/user_profile/:user_id', to: 'relationships#user_profile', as: 'user_profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
