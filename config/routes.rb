Rails.application.routes.draw do
  resources :users

	# update the root url as needed
	root "welcome#index"
end
