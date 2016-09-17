Rails.application.routes.draw do
	get 'home' => 'home#index'
  	post 'auth_user' => 'authentication#authenticate_user'
  	# devise_for :users
   #  resources :fish do
   #  	get '/feed', to: "fish#feed_fish"
  	# end
end
