Rails.application.routes.draw do
  resources :articles
	resources :output
	resources :main
	root 'application#team'
end
