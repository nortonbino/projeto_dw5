Rails.application.routes.draw do

  namespace :residents do
    get 'messages/index'
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
     
      resources :messages
    end

  end

  root to: 'home#index'

  mount ActionCable.server => '/cable'
end
