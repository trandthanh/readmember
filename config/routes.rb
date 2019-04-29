Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'cards#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  get '/books', to: "cards#books"

  resources :user do
    resources :cards, only: [:index, :new, :create]
  end

  resources :cards, only: [:show, :edit, :update, :destroy] do
    resources :notes, only: [:new, :create]
  end

  resources :notes, only: [:edit, :update, :destroy]

  # root to: 'pages#home'
end
