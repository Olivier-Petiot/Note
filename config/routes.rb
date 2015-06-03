Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'
  resources :notes
  resources :dashboard  
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  
  resources :posts do
    resources :comments
  end
  
  authenticated :user do
    root 'dashboard#index', as: "authenticated_root"
  end
  
  root 'welcome#index'
end
