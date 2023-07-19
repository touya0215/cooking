Rails.application.routes.draw do
  namespace :customer do
    get 'comments/show'
  end
  namespace :customer do
    get 'likes/index'
  end
  namespace :customer do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'posts/new'
    get 'posts/index'
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
