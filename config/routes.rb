Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get 'pages/home'
  get "score" => "pages#score"
  post "update_scores" => "pages#update_scores"

  resources :games, only: [:index, :new, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
