Rails.application.routes.draw do
  resource :session

	get "sign_up" => "users#new"
  resources :users

	# update the root url as needed
	root "welcome#index"
end
