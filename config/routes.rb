Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :events
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :attendees, only: [:create, :destroy, :index]
  # Defines the root path route ("/")
  # root "articles#index"
  root "events#index"
end
