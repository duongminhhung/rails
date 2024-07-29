Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :users
    resources :posts
  end
  match '*path', to: 'application#not_found', via: :all
end
