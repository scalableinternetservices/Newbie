Rails.application.routes.draw do


  get 'welcome/index'
  get '/searches', to: 'searches#index', as: 'search'
  resources :searches

  get '/searches/new', to: 'searches#new'

  get '/searches/:id', to: 'searches#show'

  #get '/articles/new', to: 'articles#new'
  #get '/articles/:id', to: 'articles#show'


	#resources :output
	#resources :main
	#root 'application#team'
end
