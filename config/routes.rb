Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
  get 'pages/home'
  get "score" => "pages#score"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
