Rails.application.routes.draw do
  
  get 'messages/index'

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
      get "/send_email", to: 'condominia#send_email', as: :send_email
    end

  end

  root to: 'home#index'

end
