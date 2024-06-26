Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   root to: "cars#index"
  resources :cars do
    resources :orders, only: [:new, :create]
  end
    resources :orders, only: [:destroy]
   get "my_orders", to: "pages#my_orders", as: :my_orders
   get "my_cars", to: "pages#my_cars", as: :my_cars
end
