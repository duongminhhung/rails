Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }
  namespace :admin do
    resources :users
    resources :posts
  end
  match '*path', to: 'application#not_found', via: :all
end
