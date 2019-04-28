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

  resources :user do
    resources :cards, only: [:index, :show, :new, :create]
    get '/books', to: "cards#books"
  end

  # root to: 'pages#home'
end
