Rails.application.routes.draw do
  #get '/', controller: 'home', action: 'index'
  root 'home#index'

  resources :vehicles# only:[:index, :new, :create, :show, :edit, :update]
end
