Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'ahmed', to: 'people#get_ahmed'
  post 'ahmed', to: 'people#post_ahmed'
  get 'signup', to: 'users#new'
  
  resources :articles
  resources :users, except: [:new]
end
