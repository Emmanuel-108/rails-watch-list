Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  # Lists privilages: index/new/create/show/edit/update/destroy
  resources :lists do
    # Bookmarks privilages: new/create/destroy
    resources :bookmarks, only: [:new, :create]
  end

  # has to be outside since bookmarks/:id is already targeted
  resources :bookmarks, only: [:destroy]
end
