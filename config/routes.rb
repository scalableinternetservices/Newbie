Rails.application.routes.draw do
	resources :output
	resources :main
	root 'application#team'
end
