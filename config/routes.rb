Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root to: 'home#index'

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
        resources :messages
        get "/send_email", to: 'condominia#send_email', as: :send_email
      end
  end
end
