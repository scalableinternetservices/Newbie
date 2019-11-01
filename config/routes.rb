Rails.application.routes.draw do

  get 'welcome/index'
  get '/articles', to: 'articles#index', as: 'article'

  resources :articles
	#resources :output
	#resources :main
	#root 'application#team'
end
