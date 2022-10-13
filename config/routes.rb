Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [ :create, :update] do
        collection do
          get "profile", to: "users#index"
          get "shopping_basket", to: "users#shopping_basket"
        end
      end
      resources :glasses, only: [:create]
      post 'auth/login', to: 'sessions#create'
      get '/featured', to: 'home#index'

      namespace :admin do
        post 'auth/login', to: 'sessions#create'

        resources :lenses, only: [:index, :create, :update, :destroy, :show]
        resources :frames, only: [:index, :create, :update, :destroy, :show]
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
