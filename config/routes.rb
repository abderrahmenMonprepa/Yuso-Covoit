Rails.application.routes.draw do


  resources :messages
  resources :reservations
  post '/rate' => 'rater#create', :as => 'rate'
  get 'static_pages/home'

  get 'static_pages/contact'

  get 'static_pages/about_us'

  root 'static_pages#home'

  resources :routes do 
    resources :messages
  end
	resources :users do
	  resources :user_comments
	end
  resources :routes do
    resources :user_comments
  end


  devise_for :users , :path_prefix => 'devise' , 
  controllers: {  confirmations: 'confirmations'  ,registrations: 'registrations' }

  get 'trajets' => 'routes#index'
  get 'contact' => 'static_pages#contact'
  get 'all_routes' => 'routes#all_routes'
  post 'all_routes' => 'routes#all_routes'
  get 'manage' => 'users#manage_users'

end
