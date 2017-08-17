Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :horses, shallow: true do
    resources :bookings, only: [:create, :update, :show, :delete] do
      member do
        patch "accepted", to:'bookings#set_status_accepted'
        patch "decline", to:'bookings#set_status_decline'
        patch "done", to:'bookings#set_status_done'
        patch "pending", to:'bookings#set_status_canceled'
      end
    end
  end

  resources :users, only: [:show]
  get 'team', to: "pages#team"
  get 'about', to: "pages#about"
end
