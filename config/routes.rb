Rails.application.routes.draw do
  root 'welcome#index'

  resources :recipes do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  get 'tags/:tag', to: 'recipes#index', as: :tag

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: :show do
    post 'follow', to: 'socializatons#follow'
    post 'unfollow', to: 'socializations#unfollow'
  end

  get 'users/show'

  get 'users/:id' => 'users#show', as: "user_profile"

  get 'about' => 'welcome#about'

  mount Bootsy::Engine => '/bootsy', as: 'bootsy'

end
