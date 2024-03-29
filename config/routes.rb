Rails.application.routes.draw do
  get 'posts/index'
  get 'users/index'
  devise_for :users
  root 'home#top'
  get '/' => "home#top"
  get '/about' => "home#about"
  get "/users/index" => "users#index"
  post 'users/regist/create' => "users#womancreate"
  get 'users/regist' => "users#womanregist"
  post 'users/manregist/create' => "users#mancreate"
  get 'users/manregist' => "users#manregist"
  get "users/:id" => "users#show"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  post "posts/:id/comment" => "posts#comment"
  get "posts/:id" => "posts#show"
  get 'dms' => "dms#index"
  get 'dms/:id' => "dms#show"
  post "dms/:id/send" => "dms#dmsend"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
