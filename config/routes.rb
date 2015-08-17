Rails.application.routes.draw do
  root                    'static_pages#home'
  get 'help'          =>  'static_pages#help'
  get 'about'         =>  'static_pages#about'
  get 'contact'       =>  'static_pages#contact'
  get 'signup'        =>  'users#new'
  get 'login'         =>  'sessions#new'
  post 'login'        =>  'sessions#create'
  delete 'logout'     =>  'sessions#destroy'
  post 'bookings'     =>  'bookings#create'
  get 'checkout'      =>  'checkouts#index'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :charges
end
