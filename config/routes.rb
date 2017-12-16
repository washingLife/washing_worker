Rails.application.routes.draw do
  
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do 
    member do 
      get :reset_password
      put :change_current_city
    end
  end
  resources :roles

  resources :categories do 
    resources :products
     member do
      get :prices
      post :init_prices
    end
  end

  resources :prices

  resources :price_rules

  resources :stations do
  end

  resources :addresses do
    collection do
      get :suggestion
    end
  end

  resources :cities

  resources :couriers

  resources :orders do 
  end

  resources :users do 
  end

  post '/categories/:id', :to => 'categories#recovery'
  post '/categories/:category_id/products/:id', :to => 'products#recovery'

  mount ActionCable.server => '/cable'

  root to: 'stations#index'
  root to: 'workers#signin'
end
