Rails.application.routes.draw do
  devise_for :users
  root to: 'bike_offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bike_offers do
    resources :bookings 
  end
  resources :bookings, only: [] do
    member do 
      patch "accepted"
    end
  end
  resources :bookings, only: [] do
    member do 
      patch "declined"
    end
  end
  get "/all_my_bikes", to: "bike_offers#all_my_bikes"
  resources :users, only: [ :show, :update ]
end
