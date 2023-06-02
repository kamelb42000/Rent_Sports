Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :stuffs do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:edit, :index, :destroy, :update]

  resources :bookings do
    member do
      put :accept
    end
  end
end
