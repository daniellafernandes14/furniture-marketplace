Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :products do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
