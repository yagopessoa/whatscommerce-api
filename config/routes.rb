Rails.application.routes.draw do
  scope :v1 do
    mount_devise_token_auth_for 'User', at: 'auth'

    resources :companies, only: [:create, :show, :update]
    resources :addresses, only: [:create, :show, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
