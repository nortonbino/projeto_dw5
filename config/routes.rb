Rails.application.routes.draw do
  root to: 'home#index'
  get '/login' => 'login#index'
  get '/dashboard' => 'dashboard#index'
	get '/apartament' => 'apartament#index'

end
