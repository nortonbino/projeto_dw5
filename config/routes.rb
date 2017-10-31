Rails.application.routes.draw do
  
  resources :condominia do
  	resources :fees
  end
  
  devise_for :users

  root to: 'home#index'

end
