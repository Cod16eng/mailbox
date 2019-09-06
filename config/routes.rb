Rails.application.routes.draw do

  	root 'welcome#index'
	resources :companies
	resources :users

	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	resources :mails, only: [:index, :new, :create, :destroy]

	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

