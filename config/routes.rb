Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users
  namespace :admin do

    get '' => 'admins#top'

    resources :genres, only: [:new, :create, :destroy]

    resources :labels, only: [:new, :create, :destroy]

    resources :artists, only: [:new, :create, :destroy]

    resources :orders, only: [:index, :show]

    resources :stocks, only: [:new, :index, :edit, :create, :update]

    resources :items

    resources :users, only: [:index, :edit, :show, :update, :destroy] do
      get :orders, on: :member
    end


  end

  root 'items#rankings'

  resources :items, only: [:show, :index] do
    get :ranking, on: :collection
    get :rankings, on: :collection
    resource :reviews, only: [:create]
  end

  resources :orders do
    get :thanks, on: :collection
  end

  resources :favorites, only: [:create, :destroy, :index]

  resources :cart_items, only: [:create, :destroy, :index]

  resources :labels, only: [:show]

  resources :genres, only: [:show]

  resources :artists, only: [:show]

  resources :addresses, only: [:index, :new, :create, :destroy, :edit, :update]

  resources :users, only: [:show, :edit, :update]


  #root 'home#index'

  resources :carts, only: [:show]

  post '/add_item' => 'carts#add_item'
  post '/update_item' => 'carts#update_item'
  delete '/delete_item' => 'carts#delete_item'



  # get 'users/show'
  # get 'users/edit'
  # get 'users/update'
  # get 'addresses/new'
  # get 'addresses/index'
  # get 'addresses/edit'
  # get 'addresses/destroy'
  # get 'addresses/create'
  # get 'addresses/edit'
  # get 'addresses/update'
  # get 'artists/show'
  # get 'genres/show'
  # get 'labels/show'
  # get 'cart_items/create'
  # get 'cart_items/destroy'
  # get 'cart_items/index'
  # get 'reviews/create'
  # get 'favorites/create'
  # get 'favorites/destroy'
  # get 'favorites/index'
  # get 'orders/new'
  # get 'orders/create'
  # get 'orders/show'
  # get 'orders/thanks'
  # get 'orders/index'
  # get 'orders/edit'
  # get 'orders/update'
  # get 'orders/destroy'
  # get 'items/rankings'
  # get 'items/ranking'
  # get 'items/show'
  # get 'items/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
