Rails.application.routes.draw do
  
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :worker do 
    root to: 'devise/sessions#new'
  end

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
    resources :user_cards do 
      member do 
        get :charge
        post :charge
      end
    end
    resources :coupons
  end

  resources :coupons
  resources :coupon_lists do 
    resources :order_promotions, only: [:new, :create, :edit, :update, :destroy]
  end  

  resources :user_card_charge_settings

  post '/categories/:id', :to => 'categories#recovery'
  post '/categories/:category_id/products/:id', :to => 'products#recovery'

  mount ActionCable.server => '/cable'

  root to: 'stations#index'
end
