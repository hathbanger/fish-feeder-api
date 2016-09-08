Rails.application.routes.draw do
    resources :fish do
    	get '/feed', to: "fish#feed_fish"
  	end
end
