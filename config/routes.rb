Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  resources :trips do
    resources :tasks
    resources :participants, only: [ :new, :create, :edit, :update ]
  end

  resources :tasks do
    resources :attachments, only: [ :create, :destroy ]
  end
end
