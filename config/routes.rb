Rails.application.routes.draw do
  get 'equipments/index'
  get 'equipments/show'
  get 'equipments/new'
  get 'equipments/create'
  get 'equipments/destroy'
  devise_for :users
  root to: "pages#home"
  # get 'bookings/index'
  # get 'bookings/show'
  # get 'bookings/new'
  # get 'bookings/create'
  # get 'bookings/delete'
  resources :bookings
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
