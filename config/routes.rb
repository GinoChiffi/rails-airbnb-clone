Rails.application.routes.draw do

  root to: 'static_pages#landing'

  get '/home', to: 'static_pages#home'

  resources :items, only: [:index, :show] do
  resources :item_likes, only: [:create, :destroy]
  resources :orders, only: [:create, :destroy]
  end



  resources :profiles, only: [:show] do
    member do
    patch 'follow'
    patch 'unfollow'
  end
  end




resource :dashboard, only: [:show, :edit, :update]
resource :settings, only: [:show, :edit, :update]
resource :search, only: [:show, :edit, :update]





  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
