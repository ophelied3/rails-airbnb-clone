Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :horses, shallow: true do
    resources :bookings, only: [:new, :create, :show, :delete]
  end

  resources :users, only: [:show]

end
