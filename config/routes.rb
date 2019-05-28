Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :scooters, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create]
    resource :reviews, only: [:create]
  end
  resources :bookings, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
