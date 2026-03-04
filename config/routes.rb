Rails.application.routes.draw do
  devise_for :users
  #get '/', controller: 'home', action: 'index'
  root 'vehicles#index'

  resources :vehicles# only:[:index, :new, :create, :show, :edit, :update]
end
