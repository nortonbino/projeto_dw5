Rails.application.routes.draw do
  
  namespace :residents do
    get 'dashboard/index'
  end

  devise_for :residents
  namespace :residents do
      root to: 'dashboard#index'
      get 'dashboard/:fee_id', to: 'dashboard#show'
  end


  devise_for :admins
  
  namespace :admins do

  	
    resources :condominia do
      resources :fees
      resources :residents
    end
  end

  root to: 'home#index'

end
