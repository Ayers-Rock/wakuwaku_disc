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

    resources :stocks, only: [:index]

    resources :items do
      resources :stocks, only: [:new, :create, :edit, :update]
    end

    resources :users, only: [:index, :edit, :show, :update, :destroy] do
      get :orders, on: :member
    end


  end

  root 'items#rankings'

  resources :items, only: [:show, :index] do
    get :ranking, on: :collection
    get :rankings, on: :collection
    resource :reviews, only: [:create]
    resource :favorites, only: [:create, :destroy]
  end

  resources :orders do
    get :thanks, on: :member
  end



  resources :cart_items, only: [:create, :destroy]

  resources :labels, only: [:show]

  resources :genres, only: [:show]

  resources :artists, only: [:show]


  resources :addresses, only: [:index, :new, :create, :destroy, :edit, :update]

  resources :users, only: [:show, :edit, :update] do
    resources :addresses, only: [:index, :new, :create, :destroy, :edit, :update]
    resources :favorites, only: [:index]
    resource :cart_items, only: [:update, :show]
  end






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
