Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :stuffs do
    resources :bookings, only: [:create]
  end

  resources :bookings

  resources :categories do
    resources :stuffs
  end
end
