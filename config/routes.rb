Rails.application.routes.draw do

  root to: "customers/homes#top"
  get "/", to: 'customers/homes#top', as: :customers_homes_top
  get "homes/about", to: 'customers/homes#about', as: :customers_homes_about
  get 'search', to: 'customers/homes#search', as: :customers_homes_search
  devise_for :customer, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admins/sessions',
   # passwords:     'admin/passwords',
   # registrations: 'admin/registrations'
  }

  namespace :admins do
    # namespace :admins do
      get 'homes/top'
    # end
      resources :posts do
        resource :comments, only: [:create, :destroy]
      end
    #   get 'posts/new'
    #   get 'posts/index'
    #   get 'posts/show'
    #   get 'posts/edit'
    # end
    # namespace :admin do
      resources :customers
    #   get 'customers/index'
    #   get 'customers/show'
    #   get 'customers/edit'
    # namespace :admin do
      resources :comments
    #   get 'comments/index'
    # end
  end

  scope module: :customers do
    # namespace :customer do
    get '/unsubscribe', to: 'customers#unsubscribe', as: :customer_unsubscribe
      resources :customers do
        collection do
          patch 'out'
        end

        member do #いいね一覧
          get :likes
        end
        
         member do #ランキング
          get :ranks
        end
      end
    #   get 'customers/show'
    #   get 'customers/edit'
    # end
      resources :comments
    #   get 'comments/show'
    # end
    # namespace :customer do
      resources :likes
    #   get 'likes/index'
    # end
    # namespace :customer do
      resources :posts do
        resources :comments, only: [:create, :destroy]
        resource :likes, only: [:create, :destroy] #いいね機能
      end
    #   get 'posts/new'
    #   get 'posts/index'
    #   get 'posts/show'
    #   get 'posts/edit'

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
