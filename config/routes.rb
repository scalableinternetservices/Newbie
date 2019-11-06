Rails.application.routes.draw do

  #get 'welcome/index'
  #get '/searches', to: 'searches#index', as: 'search'


  resources :users do
    resources :searches
  end


  root 'searches#index'
  
  root 'searches#index'
  devise_for :users
  resources :users
  get 'users/show'
  
  get 'welcome/index'


  #get '/users/:id', to: 'searches#index'
  get '/searches', to: 'searches#index', as: 'search'

  get '/users/:id/searches/new', to: 'searches#new'

  get '/searches/new', to: 'searches#new'


  get '/searches/new', to: 'searches#new'

  get '/searches/:id', to: 'searches#show'

	#resources :output
	#resources :main
	#root 'application#team'
end
