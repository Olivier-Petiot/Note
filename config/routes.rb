Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes
  resources :posts
  
  authenticated :user do
    root 'posts#index', as: "authenticated_root"
  end
  
  root 'welcome#index'
end
