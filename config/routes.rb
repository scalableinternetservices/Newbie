Rails.application.routes.draw do

  resources :searches
  get 'welcome/index'
  #get '/articles', to: 'articles#index', as: 'article'

  #get '/articles/new', to: 'articles#new'
  #get '/articles/:id', to: 'articles#show'


	#resources :output
	#resources :main
	#root 'application#team'
end
