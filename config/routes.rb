Rails.application.routes.draw do
  root :to => "entries#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 resources :entries do 
  resources :likes
  resources :comments
end
end