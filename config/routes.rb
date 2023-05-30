Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :stuffs do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy, :edit, :update]

  resources :categories do
    resources :stuffs

  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
