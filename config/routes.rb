Rails.application.routes.draw do
  get 'scooters/index'
  get 'scooters/show'
  get 'scooters/new'
  get 'scooters/create'
  devise_for :users
  root to: 'pages#home'
  resources :scooters, only: [:index, :show, :new, :create] do
    resource :reviews, only: [:create]
  end
  resources :users, only: [] do
    resources :bookings, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
