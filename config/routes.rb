Rails.application.routes.draw do
  resources :fees
  resources :condominia
  devise_for :users
  root to: 'home#index'
  get '/login' => 'login#index'
  get '/dashboard' => 'dashboard#index'
	get '/apartament' => 'apartament#index'

end
