Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'welcome#index'

	namespace :api do
    	namespace :v1 do
			namespace :gardens do
				get '/:id/env_measurements', to: 'env_measurements#index'
        		post '/:id/env_measurements', to: 'env_measurements#create'

        		get '/:id/jobs', to: 'jobs#index'
        		post '/:id/jobs', to: 'jobs#create'

				get '/:id/daily_avg_moisture', to: 'daily_avg_moisture#index'
			end

			resources :gardens, only: [:show, :create]

			post '/sessions', to: 'sessions#create'
			delete '/sessions', to: 'sessions#destroy'
			  
			resources :users, only: :create
    	end
  	end
end
