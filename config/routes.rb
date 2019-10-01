Rails.application.routes.draw do

  	root 'welcome#index'
  	get 'notpaid', to: 'welcome#need_to_pay'
	resources :companies
	resources :users

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	resources :posts
	resources :searches

	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

