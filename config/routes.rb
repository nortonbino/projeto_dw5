Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root to: 'home#index'

  devise_for :residents
  namespace :residents do
    get 'dashboard/index'
    root to: 'dashboard#index'
    get 'condominia/:condominium_id', to: 'dashboard#show'
    get 'messages/index'
    get 'condominia/:condominium_id/:fee_id', to: 'dashboard#show_fee'
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
