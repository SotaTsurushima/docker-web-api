Rails.application.routes.draw do
  resources :users
  root to: 'top#index'
  get '/goods/search' , to: 'goods#search'
  get '/musics/search' , to: 'musics#search'
  get '/slack/notifier' , to: 'users#notifier'
end
