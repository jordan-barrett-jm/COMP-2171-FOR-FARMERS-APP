Rails.application.routes.draw do
  resources :shopping_carts
  resources :reviews
  resources :consumers
  resources :farmers
	resources :produces
  resources :after_signup
  resources :users, only: [:edit, :update]
  devise_for :users, controllers: { 
  	registrations: 'registrations', 
  	confirmations: 'confirmations'
  }

  resources :line_items do 
    member do 
      patch 'increase_quan'
      patch 'decrease_quan'
    end
  end

  resources :orders do 
    member do
      patch "accept"
      patch "mark_as_complete"
      patch "cancel"
    end
  end

  get 'dashboard/index'
  get 'home/landing'
  root 'home#index'
end
