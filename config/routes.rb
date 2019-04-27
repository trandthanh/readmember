Rails.application.routes.draw do
  devise_for :users

  resources :user do
    resources :cards, only: [:index]
    get '/books', to: "cards#books"
  end

  root to: 'pages#home'
end
