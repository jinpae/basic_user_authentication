Rails.application.routes.draw do
	resource :password

	get "sign_out" => "sessions#destroy"
	get "sign_in" => "sessions#new"
  resource :session

	get "sign_up" => "users#new"
  resources :users

	# update the root url as needed
	root "welcome#index"
end
