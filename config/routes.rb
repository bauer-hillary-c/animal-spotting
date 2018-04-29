Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get 'pages/home'
  post "update_scores" => "pages#update_scores"

  resources :games, only: [:index, :new, :create, :show, :destroy]

  resources :animals, only: [:new, :create, :show, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
