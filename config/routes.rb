Rails.application.routes.draw do
  
  resources :categories
  devise_for :workers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :workers do 
    member do 
      get :reset_password
    end
  end
  resources :roles

  resources :categories do 
    resources :products
  end

  post '/categories/:id', :to => 'categories#recovery'
  post '/categories/:category_id/products/:id', :to => 'products#recovery'
end
