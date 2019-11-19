Rails.application.routes.draw do

  #get 'welcome/index'
  #get '/searches', to: 'searches#index', as: 'search'

  devise_for :users

  resources :users do
    resources :searches
  end

  resources :users do 
    member do 
      get :following, :followers 
    end 
  end


  root 'searches#index'

  get 'users/:id', to: 'searches#index'

  #get 'users', to:

  get 'users/show'

  get 'welcome/index'

  get '/searches', to: 'searches#index', as: 'search'

  get '/users/:id/searches/new', to: 'searches#create'

  get '/searches/new', to: 'searches#new'

  post '/searches/new', to: 'searches#create'

  get '/searches/:id', to: 'searches#show'

	#resources :output
	#resources :main
	#root 'application#team'
end
