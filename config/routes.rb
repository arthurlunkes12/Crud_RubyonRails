Rails.application.routes.draw do
  devise_for :users
  #get '/', controller: 'home', action: 'index'
  root 'vehicles#index'

  resources :vehicles do
    member do
      post :rent
    end
  end

  patch "rentals/:id/cancel", to: "vehicles#cancel", as: "cancel_rental"
# only:[:index, :new, :create, :show, :edit, :update]
end
