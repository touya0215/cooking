Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about'
  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admins/sessions',
   # passwords:     'admins/passwords',
   # registrations: 'admins/registrations'
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

  namespace :customer do
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
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
