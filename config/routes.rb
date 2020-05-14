Rails.application.routes.draw do
  scope :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :companies, only: [:create, :show, :update]
    resources :addresses, only: [:create, :show, :update]
    resources :categories, only: [:index, :create, :destroy]
  end
end
