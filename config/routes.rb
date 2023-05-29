Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :equipments do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy, :edit, :update]

  # resources :categories do
  #   resources :equipments

  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
