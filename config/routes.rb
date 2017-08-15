Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :horses, shallow: true do
    resources :bookings, only: [:create, :show, :delete]
  end

  resources :users, only: [:show]
  get 'team', to: "pages#team"
  get 'about', to: "pages#about"
end
