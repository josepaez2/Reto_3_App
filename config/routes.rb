Rails.application.routes.draw do
	
  root 'calories#index'
  resources :calories#, except: [:edit, :update, :show, :destroy]
 	
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
