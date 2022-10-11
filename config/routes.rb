Rails.application.routes.draw do
  root to: 'top#index'
  get '/goods/search' , to: 'goods#search'
  get '/musics/search' , to: 'musics#search'
  resources :musics do
    collection {get "search"}
  end
end
