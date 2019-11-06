Rails.application.routes.draw do

  root 'searches#index'
  devise_for :users
  get 'welcome/index'
  get '/searches', to: 'searches#index', as: 'search'
  resources :searches

  get '/searches/new', to: 'searches#new'

  get '/searches/:id', to: 'searches#show'

	#resources :output
	#resources :main
	#root 'application#team'
end
