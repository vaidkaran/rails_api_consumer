Rails.application.routes.draw do
  get 'welcome/index'

  root 'welcome#index'

  get 'users/sign_out' => 'users#sign_out', as: 'sign_out'
  resources :users
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
