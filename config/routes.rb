Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  root 'events#index'
 
  
  resources :event
  
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
