Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about'
  devise_for :customer, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admin/sessions',
   # passwords:     'admin/passwords',
   # registrations: 'admin/registrations'
  }

  namespace :admin do
    resources :posts
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

  scope module: :customer do
    resources :comments
  #   get 'comments/show'
  # end
  # namespace :customer do
    resources :likes
  #   get 'likes/index'
  # end
  # namespace :customer do
    resources :posts
  #   get 'posts/new'
  #   get 'posts/index'
  #   get 'posts/show'
  #   get 'posts/edit'
  # namespace :customer do
    resources :customers
  #   get 'customers/show'
  #   get 'customers/edit'
  # end
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
